import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/repository/feed_repository.dart';

void main() {
  test('seedIfEmpty does not reseed after all links are deleted', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    await database.seedIfEmpty();
    expect((await database.select(database.links).get()).isNotEmpty, isTrue);

    await database.delete(database.links).go();
    expect(await database.select(database.links).get(), isEmpty);

    await database.seedIfEmpty();

    expect(await database.select(database.links).get(), isEmpty);
    expect((await database.select(database.tags).get()).isNotEmpty, isTrue);
  });

  test(
    'repairs legacy database schema before loading links and collections',
    () async {
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
                description TEXT NOT NULL DEFAULT ''
              )
            ''')
              ..execute('''
              CREATE TABLE collections (
                id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL UNIQUE,
                type TEXT NOT NULL
              )
            ''')
              ..execute("""
              INSERT INTO links (title, url, domain, description)
              VALUES ('LEGACY_LINK', 'https://example.com', 'example.com', 'old row')
            """)
              ..execute("""
              INSERT INTO collections (title, type)
              VALUES ('WORK_PROJECTS', 'PRIVATE')
            """)
              ..execute('PRAGMA user_version = 1');
          },
        ),
      );
      addTearDown(database.close);

      await database.seedIfEmpty();

      final links = await DriftFeedRepository(database).watchLinks().first;
      final collections = await DriftCollectionsRepository(
        database,
      ).watchCollections().first;

      expect(links, hasLength(1));
      expect(links.single.link.title, 'LEGACY_LINK');
      expect(links.single.link.readingTime, isEmpty);
      expect(links.single.link.isArchived, isFalse);

      expect(collections, hasLength(1));
      expect(collections.single.collection.title, 'WORK_PROJECTS');
      expect(collections.single.collection.tagName, 'UTILITY');
    },
  );

  test(
    'links already assigned to a collection are unavailable elsewhere',
    () async {
      final database = AppDatabase(NativeDatabase.memory());
      addTearDown(database.close);

      await database.seedIfEmpty();

      final repository = DriftCollectionsRepository(database);
      final allLinks = await database.select(database.links).get();

      expect(allLinks.length, greaterThanOrEqualTo(2));

      final firstCollectionId = await repository.create(
        'FIRST_COLLECTION',
        'CUSTOM',
        'folder',
      );
      final secondCollectionId = await repository.create(
        'SECOND_COLLECTION',
        'CUSTOM',
        'stack',
      );

      final assignedLinkId = allLinks.first.id;

      await repository.addLink(firstCollectionId, assignedLinkId);

      final availableLinks = await repository
          .watchAvailableLinks(secondCollectionId)
          .first;

      expect(
        availableLinks.any((item) => item.link.id == assignedLinkId),
        isFalse,
      );
    },
  );
}
