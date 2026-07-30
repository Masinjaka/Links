import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';

void main() {
  test('adds favorite and pin state to version four collections', () async {
    final database = AppDatabase(
      NativeDatabase.memory(
        setup: (rawDb) {
          rawDb
            ..execute('''
              CREATE TABLE collections (
                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL UNIQUE,
                type TEXT NOT NULL,
                icon_key TEXT NOT NULL DEFAULT 'folder',
                tag_name TEXT NOT NULL DEFAULT '',
                is_archived INTEGER NOT NULL DEFAULT 0,
                created_at DATETIME NOT NULL DEFAULT 0,
                updated_at DATETIME NOT NULL DEFAULT 0
              )
            ''')
            ..execute("""
              INSERT INTO collections (title, type)
              VALUES ('READING', 'CUSTOM')
            """)
            ..execute('PRAGMA user_version = 4');
        },
      ),
    );
    addTearDown(database.close);

    final collection = await database.select(database.collections).getSingle();

    expect(collection.isFavourite, isFalse);
    expect(collection.isPinned, isFalse);
  });
}
