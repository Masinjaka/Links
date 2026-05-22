import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Links extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get url => text().unique()();
  TextColumn get domain => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get sourceImageUrl => text().nullable()();
  TextColumn get readingTime => text().withDefault(const Constant(''))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class LinkPreviews extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get linkId =>
      integer().references(Links, #id, onDelete: KeyAction.cascade).unique()();
  TextColumn get previewTitle => text()();
  TextColumn get previewDescription => text().withDefault(const Constant(''))();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get imageLabel =>
      text().withDefault(const Constant('SOURCE_PREVIEW.JPG'))();
  TextColumn get imageDimensions =>
      text().withDefault(const Constant('1240 x 800'))();
  DateTimeColumn get fetchedAt => dateTime().withDefault(currentDateAndTime)();
}

class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get category => text().withDefault(const Constant('GENERAL'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class LinkTags extends Table {
  IntColumn get linkId =>
      integer().references(Links, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId =>
      integer().references(Tags, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {linkId, tagId};
}

class Collections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().unique()();
  TextColumn get type => text()();
  TextColumn get iconKey => text().withDefault(const Constant('folder'))();
  TextColumn get tagName => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class CollectionLinks extends Table {
  IntColumn get collectionId =>
      integer().references(Collections, #id, onDelete: KeyAction.cascade)();
  IntColumn get linkId =>
      integer().references(Links, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {collectionId, linkId};
}

class UserProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get displayName =>
      text().withDefault(const Constant('USER_CORE'))();
  TextColumn get authLevel =>
      text().withDefault(const Constant('AUTH_LEVEL_01'))();
  IntColumn get linksSaved => integer().withDefault(const Constant(1284))();
  RealColumn get dataUsedMb => real().withDefault(const Constant(42.8))();
  RealColumn get storagePercent => real().withDefault(const Constant(.68))();
  TextColumn get version =>
      text().withDefault(const Constant('LINKVAULT_OS v2.4.0-STABLE'))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class ProfileMetrics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId =>
      integer().references(UserProfiles, #id, onDelete: KeyAction.cascade)();
  TextColumn get label => text()();
  RealColumn get value => real()();
  IntColumn get sortOrder => integer()();
}

class SettingItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get section => text()();
  TextColumn get title => text()();
  TextColumn get subtitle => text().withDefault(const Constant(''))();
  TextColumn get kind => text().withDefault(const Constant('row'))();
  TextColumn get iconKey => text().withDefault(const Constant('settings'))();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  IntColumn get sortOrder => integer()();
}

class OnboardingSteps extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get stepNumber => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get iconKey => text()();
  BoolColumn get showPlatforms =>
      boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer()();
}

class BrowserPlatforms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get iconKey => text().withDefault(const Constant('public'))();
  IntColumn get sortOrder => integer()();
}

@DriftDatabase(
  tables: [
    Links,
    LinkPreviews,
    Tags,
    LinkTags,
    Collections,
    CollectionLinks,
    UserProfiles,
    ProfileMetrics,
    SettingItems,
    OnboardingSteps,
    BrowserPlatforms,
  ],
)
final class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  AppDatabase.defaults() : super(driftDatabase(name: 'linkvault'));

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
    },
    onUpgrade: (migrator, from, to) async {
      await _ensureExpectedTables();
      await _ensureExpectedColumns();
      await _normalizeLegacyData();
      if (from < 3) {
        await _backfillCollectionTags();
      }
    },
    beforeOpen: (details) async {
      await _ensureExpectedTables();
      await _ensureExpectedColumns();
      await _normalizeLegacyData();
    },
  );

  Future<void> _ensureExpectedTables() async {
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "links" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "title" TEXT NOT NULL,
        "url" TEXT NOT NULL UNIQUE,
        "domain" TEXT NOT NULL,
        "description" TEXT NOT NULL DEFAULT '',
        "source_image_url" TEXT,
        "reading_time" TEXT NOT NULL DEFAULT '',
        "is_archived" INTEGER NOT NULL DEFAULT 0 CHECK ("is_archived" IN (0, 1)),
        "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "link_previews" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "link_id" INTEGER NOT NULL UNIQUE REFERENCES "links" ("id") ON DELETE CASCADE,
        "preview_title" TEXT NOT NULL,
        "preview_description" TEXT NOT NULL DEFAULT '',
        "image_url" TEXT,
        "image_label" TEXT NOT NULL DEFAULT 'SOURCE_PREVIEW.JPG',
        "image_dimensions" TEXT NOT NULL DEFAULT '1240 x 800',
        "fetched_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "tags" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "name" TEXT NOT NULL UNIQUE,
        "category" TEXT NOT NULL DEFAULT 'GENERAL',
        "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "link_tags" (
        "link_id" INTEGER NOT NULL REFERENCES "links" ("id") ON DELETE CASCADE,
        "tag_id" INTEGER NOT NULL REFERENCES "tags" ("id") ON DELETE CASCADE,
        PRIMARY KEY ("link_id", "tag_id")
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "collections" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "title" TEXT NOT NULL UNIQUE,
        "type" TEXT NOT NULL,
        "icon_key" TEXT NOT NULL DEFAULT 'folder',
        "tag_name" TEXT NOT NULL DEFAULT '',
        "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "collection_links" (
        "collection_id" INTEGER NOT NULL REFERENCES "collections" ("id") ON DELETE CASCADE,
        "link_id" INTEGER NOT NULL REFERENCES "links" ("id") ON DELETE CASCADE,
        PRIMARY KEY ("collection_id", "link_id")
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "user_profiles" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "display_name" TEXT NOT NULL DEFAULT 'USER_CORE',
        "auth_level" TEXT NOT NULL DEFAULT 'AUTH_LEVEL_01',
        "links_saved" INTEGER NOT NULL DEFAULT 1284,
        "data_used_mb" REAL NOT NULL DEFAULT 42.8,
        "storage_percent" REAL NOT NULL DEFAULT 0.68,
        "version" TEXT NOT NULL DEFAULT 'LINKVAULT_OS v2.4.0-STABLE',
        "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "profile_metrics" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "profile_id" INTEGER NOT NULL REFERENCES "user_profiles" ("id") ON DELETE CASCADE,
        "label" TEXT NOT NULL,
        "value" REAL NOT NULL,
        "sort_order" INTEGER NOT NULL
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "setting_items" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "section" TEXT NOT NULL,
        "title" TEXT NOT NULL,
        "subtitle" TEXT NOT NULL DEFAULT '',
        "kind" TEXT NOT NULL DEFAULT 'row',
        "icon_key" TEXT NOT NULL DEFAULT 'settings',
        "enabled" INTEGER NOT NULL DEFAULT 1 CHECK ("enabled" IN (0, 1)),
        "sort_order" INTEGER NOT NULL
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "onboarding_steps" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "step_number" TEXT NOT NULL,
        "title" TEXT NOT NULL,
        "description" TEXT NOT NULL,
        "icon_key" TEXT NOT NULL,
        "show_platforms" INTEGER NOT NULL DEFAULT 0 CHECK ("show_platforms" IN (0, 1)),
        "sort_order" INTEGER NOT NULL
      )
    ''');
    await customStatement('''
      CREATE TABLE IF NOT EXISTS "browser_platforms" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "name" TEXT NOT NULL UNIQUE,
        "icon_key" TEXT NOT NULL DEFAULT 'public',
        "sort_order" INTEGER NOT NULL
      )
    ''');
  }

  Future<void> _ensureExpectedColumns() async {
    await _ensureColumns('links', {
      'source_image_url': 'TEXT',
      'reading_time': "TEXT NOT NULL DEFAULT ''",
      'is_archived':
          'INTEGER NOT NULL DEFAULT 0 CHECK ("is_archived" IN (0, 1))',
      'created_at': 'DATETIME NOT NULL DEFAULT 0',
      'updated_at': 'DATETIME NOT NULL DEFAULT 0',
    });
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
      'created_at': 'DATETIME NOT NULL DEFAULT 0',
    });
  }

  Future<void> _ensureColumns(
    String tableName,
    Map<String, String> columns,
  ) async {
    final existingColumns = await _tableColumns(tableName);
    for (final entry in columns.entries) {
      if (existingColumns.contains(entry.key)) {
        continue;
      }

      await customStatement(
        'ALTER TABLE "$tableName" ADD COLUMN "${entry.key}" ${entry.value}',
      );
    }
  }

  Future<Set<String>> _tableColumns(String tableName) async {
    final rows = await customSelect('PRAGMA table_info("$tableName")').get();
    return {for (final row in rows) row.read<String>('name')};
  }

  Future<void> _normalizeLegacyData() async {
    final linkColumns = await _tableColumns('links');
    if (!linkColumns.contains('reading_time')) {
      return;
    }

    await customStatement(
      "UPDATE links SET reading_time = '' WHERE reading_time = 'READ_5_MIN'",
    );
  }

  Future<void> _backfillCollectionTags() async {
    final collectionColumns = await _tableColumns('collections');
    if (!collectionColumns.contains('tag_name')) {
      return;
    }

    await customStatement(
      "UPDATE collections SET tag_name = 'UTILITY' WHERE tag_name = '' AND title = 'WORK_PROJECTS'",
    );
    await customStatement(
      "UPDATE collections SET tag_name = 'ARCHIVE' WHERE tag_name = '' AND title = 'READ_LATER'",
    );
    await customStatement(
      "UPDATE collections SET tag_name = 'DESIGN' WHERE tag_name = '' AND title = 'DESIGN_INSP'",
    );
    await customStatement(
      "UPDATE collections SET tag_name = 'DEVELOPMENT' WHERE tag_name = '' AND title = 'DEV_RESOURCES'",
    );
  }

  Future<void> seedIfEmpty() async {
    final isInitialized =
        await _hasAnyRows(tags) ||
        await _hasAnyRows(collections) ||
        await _hasAnyRows(userProfiles) ||
        await _hasAnyRows(settingItems) ||
        await _hasAnyRows(onboardingSteps) ||
        await _hasAnyRows(browserPlatforms) ||
        await _hasAnyRows(links);
    if (isInitialized) {
      return;
    }

    await transaction(() async {
      final tagIds = <String, int>{};
      for (final tag in _seedTags) {
        tagIds[tag] = await into(tags).insert(TagsCompanion.insert(name: tag));
      }

      final philosophyLinkId = await _insertLink(
        title: 'FUTURISM MANIFESTO 2024',
        url: 'https://manifesto.io/kinetic',
        domain: 'manifesto.io',
        description: _manifestoDescription,
        sourceImageUrl:
            'https://dimg.dreamflow.cloud/v1/image/abstract+kinetic+typography+poster+with+bold+black+and+white+letters+and+neon+accents',
        tagNames: ['PHILOSOPHY', 'KINETIC_UI', 'VELOCITY'],
        tagIds: tagIds,
        createdAt: DateTime(2024, 4, 12, 14, 30, 1),
      );
      await _insertLink(
        title: 'HIGH-VELOCITY GRID SYSTEMS',
        url: 'https://grid.dev/sharp-edges',
        domain: 'grid.dev',
        description: 'A practical reference for strict grid systems.',
        tagNames: ['DESIGN', 'UI_DESIGN'],
        tagIds: tagIds,
        createdAt: DateTime(2024, 3, 28),
      );
      await _insertLink(
        title: 'METAL_GEAR_SOLID_REF_UI',
        url: 'https://vault.com/mgs-interface',
        domain: 'vault.com',
        description: 'Interface references for dense tactical UI systems.',
        tagNames: ['INSPIRATION'],
        tagIds: tagIds,
        createdAt: DateTime(2024, 2, 15),
      );
      await _insertLink(
        title: 'OSWALD TYPEFACE SPECIMEN',
        url: 'https://fonts.google.com/oswald',
        domain: 'fonts.google.com',
        description: 'Typeface specimen and usage notes.',
        tagNames: ['TYPOGRAPHY'],
        tagIds: tagIds,
        createdAt: DateTime(2024),
      );
      await _insertLink(
        title: 'REACT_KINETIC_ANIMATIONS',
        url: 'https://github.com/motion/logic',
        domain: 'github.com',
        description: 'Animation logic repository.',
        tagNames: ['DEV', 'DEVELOPMENT'],
        tagIds: tagIds,
        createdAt: DateTime(2023, 12, 22),
      );
      await _insertLink(
        title: 'Flutter Kinetic Animation Engine',
        url: 'https://github.com/velocity/flutter-kinetic',
        domain: 'github.com',
        description: 'A Flutter animation runtime for kinetic interfaces.',
        tagNames: ['DEVELOPMENT', 'RESEARCH'],
        tagIds: tagIds,
        createdAt: DateTime(2024, 5, 12),
      );
      await _insertLink(
        title: 'The Future of Grid Systems',
        url: 'https://medium.com/grid-systems/future',
        domain: 'medium.com',
        description: 'Research notes on modern grid systems.',
        tagNames: ['UI_DESIGN', 'FUTURISM'],
        tagIds: tagIds,
        createdAt: DateTime(2024, 4, 28),
      );
      await _insertLink(
        title: 'Cyberpunk Interface Guidelines',
        url: 'https://notion.so/cyberpunk-interface-guidelines',
        domain: 'notion.so',
        description: 'Guidelines for high contrast cyberpunk interfaces.',
        tagNames: ['UI_DESIGN', 'WEB3'],
        tagIds: tagIds,
        createdAt: DateTime(2024, 3, 15),
      );
      await _insertLink(
        title: 'High Velocity UX Research',
        url: 'https://github.com/velocity/ux-research',
        domain: 'github.com',
        description: 'Research backlog for high velocity UX.',
        tagNames: ['RESEARCH', 'DEVELOPMENT'],
        tagIds: tagIds,
        createdAt: DateTime(2024, 2, 10),
      );

      final collectionIds = <String, int>{};
      for (final item in _seedCollections) {
        collectionIds[item.$1] = await into(collections).insert(
          CollectionsCompanion.insert(
            title: item.$1,
            type: item.$2,
            iconKey: Value(item.$3),
            tagName: Value(item.$4),
          ),
        );
      }

      for (final entry in collectionIds.entries) {
        await into(collectionLinks).insert(
          CollectionLinksCompanion.insert(
            collectionId: entry.value,
            linkId: philosophyLinkId,
          ),
        );
      }

      final profileId = await into(
        userProfiles,
      ).insert(UserProfilesCompanion.insert());
      for (final (index, metric) in _profileMetrics.indexed) {
        await into(profileMetrics).insert(
          ProfileMetricsCompanion.insert(
            profileId: profileId,
            label: metric.$1,
            value: metric.$2,
            sortOrder: index,
          ),
        );
      }

      for (final (index, item) in _settings.indexed) {
        await into(settingItems).insert(
          SettingItemsCompanion.insert(
            section: item.$1,
            title: item.$2,
            subtitle: Value(item.$3),
            kind: Value(item.$4),
            iconKey: Value(item.$5),
            sortOrder: index,
          ),
        );
      }

      for (final (index, step) in _onboarding.indexed) {
        await into(onboardingSteps).insert(
          OnboardingStepsCompanion.insert(
            stepNumber: step.$1,
            title: step.$2,
            description: step.$3,
            iconKey: step.$4,
            showPlatforms: Value(step.$5),
            sortOrder: index,
          ),
        );
      }

      for (final (index, platform) in _platforms.indexed) {
        await into(browserPlatforms).insert(
          BrowserPlatformsCompanion.insert(
            name: platform.$1,
            iconKey: Value(platform.$2),
            sortOrder: index,
          ),
        );
      }
    });
  }

  Future<bool> _hasAnyRows<T extends Table, D>(TableInfo<T, D> table) async {
    final row = await customSelect(
      'SELECT EXISTS(SELECT 1 FROM "${table.actualTableName}" LIMIT 1) AS has_rows',
    ).getSingle();
    return row.read<int>('has_rows') == 1;
  }

  Future<int> _insertLink({
    required String title,
    required String url,
    required String domain,
    required String description,
    required List<String> tagNames,
    required Map<String, int> tagIds,
    required DateTime createdAt,
    String? sourceImageUrl,
  }) async {
    final linkId = await into(links).insert(
      LinksCompanion.insert(
        title: title,
        url: url,
        domain: domain,
        description: Value(description),
        sourceImageUrl: Value(sourceImageUrl),
        createdAt: Value(createdAt),
        updatedAt: Value(createdAt),
      ),
    );
    await into(linkPreviews).insert(
      LinkPreviewsCompanion.insert(
        linkId: linkId,
        previewTitle: title,
        previewDescription: Value(description),
        imageUrl: Value(sourceImageUrl),
      ),
    );

    for (final tag in tagNames) {
      final tagId = tagIds[tag] ??= await into(
        tags,
      ).insert(TagsCompanion.insert(name: tag));
      await into(
        linkTags,
      ).insert(LinkTagsCompanion.insert(linkId: linkId, tagId: tagId));
    }

    return linkId;
  }
}

const _seedTags = [
  'PHILOSOPHY',
  'KINETIC_UI',
  'VELOCITY',
  'DESIGN',
  'UI_DESIGN',
  'INSPIRATION',
  'TYPOGRAPHY',
  'DEV',
  'DEVELOPMENT',
  'RESEARCH',
  'FUTURISM',
  'WEB3',
  'ARCHIVE',
  'UTILITY',
];

const _manifestoDescription =
    "This document explores the intersection of high-velocity motion graphics and traditional Swiss typography. It defines a new framework for 'Kinetic Futurism' where information density is balanced with rhythmic animation loops. Key takeaways include the use of monospaced fonts for technical precision and high-contrast color palettes for readability in low-light environments.";

const _seedCollections = [
  ('WORK_PROJECTS', 'PRIVATE', 'folder', 'UTILITY'),
  ('READ_LATER', 'QUEUE', 'bookmark', 'ARCHIVE'),
  ('DESIGN_INSP', 'SHARED', 'mosaic', 'DESIGN'),
  ('DEV_RESOURCES', 'SYSTEM', 'terminal', 'DEVELOPMENT'),
];

const _profileMetrics = [
  ('M', 12.0),
  ('T', 25.0),
  ('W', 18.0),
  ('T', 35.0),
  ('F', 42.0),
  ('S', 38.0),
  ('S', 55.0),
];

const _settings = [
  ('ACCOUNT', 'Pro Plan', 'Active until Dec 2024', 'row', 'person'),
  ('ACCOUNT', 'Cloud Sync', 'Last synced 2m ago', 'row', 'storage'),
  ('APPEARANCE', 'Dark Mode', 'High contrast interface', 'switch', 'dark'),
  (
    'APPEARANCE',
    'Kinetic Animations',
    'Fluid UI transitions',
    'switch',
    'motion',
  ),
  ('APPEARANCE', 'Accent Color', 'System-wide highlight', 'accent', 'palette'),
  ('DATA & EXPORT', 'Export Library (.csv)', '', 'button', 'download'),
  ('DATA & EXPORT', 'Import from Pocket/Raindrop', '', 'button', 'upload'),
  ('DATA & EXPORT', 'Clear Cache', '', 'button_outline', 'delete'),
];

const _onboarding = [
  (
    '01',
    'CAPTURE_EVERYTHING',
    'Save URLs instantly. LinkVault automatically generates summaries, fetches favicons, and suggests relevant tags for your collection.',
    'capture',
    false,
  ),
  (
    '02',
    'BROWSER_POWER',
    'Install our high-velocity extension to save links without leaving your current tab. One click, infinite organization.',
    'browser',
    true,
  ),
  (
    '03',
    'VELOCITY_SEARCH',
    'Find any link in milliseconds with our command-palette style search. Your personal web archive, indexed and ready.',
    'search',
    false,
  ),
];

const _platforms = [
  ('Chrome', 'googlechrome'),
  ('Firefox', 'firefox'),
  ('Safari', 'safari'),
  ('Edge', 'microsoftedge'),
];
