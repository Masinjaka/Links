import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';

void main() {
  test('upgrades a version three link with lifecycle defaults', () async {
    final database = AppDatabase(
      NativeDatabase.memory(
        setup: (rawDb) {
          rawDb
            ..execute('''
              CREATE TABLE links (
                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL,
                url TEXT NOT NULL UNIQUE,
                domain TEXT NOT NULL,
                description TEXT NOT NULL DEFAULT '',
                source_image_url TEXT,
                reading_time TEXT NOT NULL DEFAULT '',
                is_archived INTEGER NOT NULL DEFAULT 0,
                created_at DATETIME NOT NULL DEFAULT 0,
                updated_at DATETIME NOT NULL DEFAULT 0
              )
            ''')
            ..execute("""
              INSERT INTO links (title, url, domain, is_archived)
              VALUES ('ARCHIVED', 'https://Example.com/a', 'Example.com', 1)
            """)
            ..execute('PRAGMA user_version = 3');
        },
      ),
    );
    addTearDown(database.close);

    final link = await database.select(database.links).getSingle();

    expect(link.originalUrl, 'https://Example.com/a');
    expect(link.normalizedUrl, 'https://example.com/a');
    expect(link.status, 'archived');
    expect(link.metadataStatus, 'pending');
    expect(
      await database.customSelect('SELECT * FROM link_search').get(),
      hasLength(1),
    );
  });
}
