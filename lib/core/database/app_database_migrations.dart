part of 'app_database.dart';

MigrationStrategy buildMigrationStrategy(AppDatabase db) {
  return MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
      await db._ensureSearchSchema();
    },
    onUpgrade: (migrator, from, to) async {
      await db._ensureExpectedTables(migrator);
      await db._ensureExpectedColumns();
      await db._normalizeLegacyData();
      if (from < 3) await db._backfillCollectionTags();
      if (from < 4) await db._backfillBookmarkFoundation();
      await db._ensureSearchSchema();
    },
    beforeOpen: (details) async {
      final migrator = Migrator(db);
      await db._ensureExpectedTables(migrator);
      await db._ensureExpectedColumns();
      await db._normalizeLegacyData();
      await db._backfillBookmarkFoundation();
      await db._ensureSearchSchema();
    },
  );
}

extension _AppDatabaseMigrations on AppDatabase {
  Future<void> _ensureExpectedTables(Migrator migrator) async {
    await _createIfMissing(migrator, links);
    await _createIfMissing(migrator, linkPreviews);
    await _createIfMissing(migrator, tags);
    await _createIfMissing(migrator, linkTags);
    await _createIfMissing(migrator, collections);
    await _createIfMissing(migrator, collectionLinks);
    await _createIfMissing(migrator, bookmarkSnapshots);
    await _createIfMissing(migrator, pendingTasks);
    await _createIfMissing(migrator, userProfiles);
    await _createIfMissing(migrator, profileMetrics);
    await _createIfMissing(migrator, settingItems);
    await _createIfMissing(migrator, onboardingSteps);
    await _createIfMissing(migrator, browserPlatforms);
  }

  Future<void> _createIfMissing<T extends Table, D>(
    Migrator migrator,
    TableInfo<T, D> table,
  ) async {
    final exists = await customSelect(
      "SELECT 1 FROM sqlite_master WHERE type = 'table' AND name = ? LIMIT 1",
      variables: [Variable(table.actualTableName)],
    ).getSingleOrNull();
    if (exists == null) await migrator.createTable(table);
  }

  Future<void> _ensureExpectedColumns() async {
    await _ensureColumns('links', _linkFoundationColumns);
    await _ensureColumns('link_previews', {
      'preview_description': "TEXT NOT NULL DEFAULT ''",
      'image_url': 'TEXT',
      'image_label': "TEXT NOT NULL DEFAULT 'SOURCE_PREVIEW.JPG'",
      'image_dimensions': "TEXT NOT NULL DEFAULT '1240 x 800'",
      'fetched_at': 'DATETIME NOT NULL DEFAULT 0',
    });
    await _ensureColumns('tags', {
      'category': "TEXT NOT NULL DEFAULT 'GENERAL'",
      'created_at': 'DATETIME NOT NULL DEFAULT 0',
    });
    await _ensureColumns('collections', {
      'icon_key': "TEXT NOT NULL DEFAULT 'folder'",
      'tag_name': "TEXT NOT NULL DEFAULT ''",
      'is_favourite': 'INTEGER NOT NULL DEFAULT 0',
      'is_pinned': 'INTEGER NOT NULL DEFAULT 0',
      'is_archived': 'INTEGER NOT NULL DEFAULT 0',
      'created_at': 'DATETIME NOT NULL DEFAULT 0',
      'updated_at': 'DATETIME NOT NULL DEFAULT 0',
    });
    await _ensureColumns('collection_links', {
      'added_at': 'DATETIME NOT NULL DEFAULT 0',
      'sort_order': 'INTEGER NOT NULL DEFAULT 0',
    });
  }

  Future<void> _ensureColumns(
    String tableName,
    Map<String, String> columns,
  ) async {
    final existing = await _tableColumns(tableName);
    for (final entry in columns.entries) {
      if (!existing.contains(entry.key)) {
        await customStatement(
          'ALTER TABLE "$tableName" ADD COLUMN "${entry.key}" ${entry.value}',
        );
      }
    }
  }

  Future<Set<String>> _tableColumns(String tableName) async {
    final rows = await customSelect('PRAGMA table_info("$tableName")').get();
    return {for (final row in rows) row.read<String>('name')};
  }

  Future<void> _normalizeLegacyData() async {
    if (!(await _tableColumns('links')).contains('reading_time')) return;
    await customStatement(
      "UPDATE links SET reading_time = '' WHERE reading_time = 'READ_5_MIN'",
    );
  }

  Future<void> _backfillCollectionTags() async {
    if (!(await _tableColumns('collections')).contains('tag_name')) return;
    const values = {
      'WORK_PROJECTS': 'UTILITY',
      'READ_LATER': 'ARCHIVE',
      'DESIGN_INSP': 'DESIGN',
      'DEV_RESOURCES': 'DEVELOPMENT',
    };
    for (final entry in values.entries) {
      await customStatement(
        "UPDATE collections SET tag_name = ? "
        "WHERE tag_name = '' AND title = ?",
        [entry.value, entry.key],
      );
    }
  }

  Future<void> _backfillBookmarkFoundation() async {
    await customStatement(
      "UPDATE links SET original_url = url WHERE original_url = ''",
    );
    await customStatement(
      "UPDATE links SET normalized_url = lower(url) WHERE normalized_url = ''",
    );
    await customStatement(
      "UPDATE links SET url_hash = lower(url) WHERE url_hash = ''",
    );
    await customStatement(
      "UPDATE links SET status = 'archived' WHERE is_archived = 1",
    );
  }
}

const _linkFoundationColumns = {
  'original_url': "TEXT NOT NULL DEFAULT ''",
  'normalized_url': "TEXT NOT NULL DEFAULT ''",
  'canonical_url': 'TEXT',
  'url_hash': "TEXT NOT NULL DEFAULT ''",
  'description': "TEXT NOT NULL DEFAULT ''",
  'note': "TEXT NOT NULL DEFAULT ''",
  'source_image_url': 'TEXT',
  'favicon_url': 'TEXT',
  'reading_time': "TEXT NOT NULL DEFAULT ''",
  'content_type': "TEXT NOT NULL DEFAULT 'webpage'",
  'status': "TEXT NOT NULL DEFAULT 'active'",
  'is_favourite': 'INTEGER NOT NULL DEFAULT 0',
  'is_pinned': 'INTEGER NOT NULL DEFAULT 0',
  'is_archived': 'INTEGER NOT NULL DEFAULT 0',
  'metadata_status': "TEXT NOT NULL DEFAULT 'pending'",
  'offline_status': "TEXT NOT NULL DEFAULT 'unavailable'",
  'link_health_status': "TEXT NOT NULL DEFAULT 'unknown'",
  'created_at': 'DATETIME NOT NULL DEFAULT 0',
  'updated_at': 'DATETIME NOT NULL DEFAULT 0',
  'last_opened_at': 'DATETIME',
  'archived_at': 'DATETIME',
  'deleted_at': 'DATETIME',
  'metadata_fetched_at': 'DATETIME',
  'link_checked_at': 'DATETIME',
  'manual_sort_order': 'INTEGER NOT NULL DEFAULT 0',
};
