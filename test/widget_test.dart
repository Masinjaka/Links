import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linkvault/app/app_router.dart';
import 'package:linkvault/app/linkvault_app.dart';
import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/add_link/provider/add_link_metadata_providers.dart';
import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/add_link/repository/add_link_repository.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/feed/repository/feed_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/link_details/provider/link_details_providers.dart';
import 'package:linkvault/features/link_details/repository/link_details_repository.dart';
import 'package:linkvault/features/onboarding/provider/onboarding_providers.dart';
import 'package:linkvault/features/onboarding/repository/onboarding_repository.dart';
import 'package:linkvault/features/profile/provider/profile_providers.dart';
import 'package:linkvault/features/profile/repository/profile_repository.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/features/settings/repository/settings_repository.dart';

void main() {
  testWidgets('renders the feed page', (tester) async {
    await tester.pumpLinkVault('/');

    expect(find.text('LINK'), findsOneWidget);
    expect(find.text('VAULT_v2'), findsOneWidget);
    expect(find.text('SEARCH_SYSTEM...'), findsOneWidget);
    expect(find.text('ALL_ASSETS'), findsOneWidget);
  });

  for (final route in const {
    '/onboarding': 'SKIP_INTRO',
    '/add': 'PASTE_URL',
    '/add?id=1': 'EDIT_LINK',
    '/collections': 'COLLECTIONS_v2',
    '/details?id=1': 'VAULT / ASSET_VIEW',
    '/profile': 'USER_CORE',
    '/settings': 'PREFERENCES',
  }.entries) {
    testWidgets('renders ${route.key}', (tester) async {
      await tester.pumpLinkVault(route.key);

      expect(find.text(route.value), findsOneWidget);
    });
  }

  testWidgets('details back button falls back to feed', (tester) async {
    await tester.pumpLinkVault('/details?id=1');

    await tester.tap(find.byIcon(Icons.arrow_back_rounded));
    await tester.pumpAppFrame();

    expect(find.text('VAULT_v2'), findsOneWidget);
  });

  testWidgets('add link back button falls back to feed', (tester) async {
    await tester.pumpLinkVault('/add');

    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    await tester.pumpAppFrame();

    expect(find.text('VAULT_v2'), findsOneWidget);
  });

  testWidgets('add link metadata card stays hidden until url input', (
    tester,
  ) async {
    await tester.pumpLinkVault('/add');

    expect(find.text('FETCHING_METADATA...'), findsNothing);
    expect(find.text('manifesto.io'), findsNothing);

    await tester.enterText(
      find.byType(TextField).first,
      'https://manifesto.io/kinetic',
    );
    await tester.pump();

    expect(find.text('FETCHING_METADATA...'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();
  });

  testWidgets('add link metadata card renders fetched metadata', (
    tester,
  ) async {
    await tester.pumpLinkVault('/add');

    await tester.enterText(
      find.byType(TextField).first,
      'https://manifesto.io/kinetic',
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();

    expect(find.text('MANIFESTO.IO'), findsOneWidget);
    expect(find.text('Manifesto Preview'), findsOneWidget);
    expect(find.text('Kinetic futurism reference.'), findsOneWidget);
  });

  testWidgets('edit link page preloads the existing link data', (tester) async {
    await tester.pumpLinkVault('/add?id=1');
    await tester.pump();
    await tester.pump();

    expect(find.text('EDIT_LINK'), findsOneWidget);
    expect(find.text('https://manifesto.io/kinetic'), findsOneWidget);
    expect(find.text('MANIFESTO.IO'), findsWidgets);
  });

  testWidgets('details page hides reading time chip when metadata is absent', (
    tester,
  ) async {
    await tester.pumpLinkVault('/details?id=1');

    expect(find.text('READ_5_MIN'), findsNothing);
  });

  testWidgets('add link page shows persisted tags from the repository', (
    tester,
  ) async {
    await tester.pumpLinkVault('/add');

    expect(find.text('PERSISTED_DB'), findsOneWidget);
  });

  testWidgets('add link plus button adds a new tag chip', (tester) async {
    await tester.pumpLinkVault('/add');

    await tester.enterText(
      find.descendant(
        of: find.byKey(const Key('add-link-tag-input')),
        matching: find.byType(EditableText),
      ),
      'Motion Study',
    );
    final addButton = find.byKey(const Key('add-link-new-tag-button'));
    final gesture = tester.widget<GestureDetector>(addButton);
    gesture.onTap?.call();
    await tester.pump();

    expect(find.text('MOTION_STUDY'), findsOneWidget);
  });

  testWidgets(
    'new tags added while editing show up in feed filters immediately',
    (tester) async {
      await tester.pumpLinkVault('/add?id=1');
      expect(find.text('EDIT_LINK'), findsOneWidget);

      final container = ProviderScope.containerOf(
        tester.element(find.text('EDIT_LINK')),
      );
      container
          .read(addLinkOptimisticTagsProvider.notifier)
          .add('FRESH_FILTER');

      appRouter.go('/');
      await tester.pumpAppFrame();

      expect(find.text('FRESH_FILTER'), findsOneWidget);
    },
  );
}

extension _WidgetTesterAppFrame on WidgetTester {
  Future<void> pumpLinkVault(String route) async {
    appRouter.go(route);

    await pumpWidget(
      ProviderScope(
        overrides: [
          seedDatabaseProvider.overrideWith((ref) async {}),
          feedRepositoryProvider.overrideWith(
            (ref) => _FakeLinkDataRepository(),
          ),
          addLinkRepositoryProvider.overrideWith(
            (ref) => _FakeLinkDataRepository(),
          ),
          addLinkMetadataRepositoryProvider.overrideWith(
            (ref) => const _FakeAddLinkMetadataRepository(),
          ),
          linkDetailsRepositoryProvider.overrideWith(
            (ref) => _FakeLinkDataRepository(),
          ),
          collectionsRepositoryProvider.overrideWith(
            (ref) => _FakeCollectionsRepository(),
          ),
          profileRepositoryProvider.overrideWith(
            (ref) => _FakeSystemDataRepository(),
          ),
          settingsRepositoryProvider.overrideWith(
            (ref) => _FakeSystemDataRepository(),
          ),
          onboardingRepositoryProvider.overrideWith(
            (ref) => _FakeSystemDataRepository(),
          ),
        ],
        child: const LinkVaultApp(),
      ),
    );
    await pumpAppFrame();
  }

  Future<void> pumpAppFrame() async {
    await pump();
    await pump(const Duration(milliseconds: 250));
    await pump(const Duration(milliseconds: 250));
    await pump(const Duration(milliseconds: 250));
  }
}

final _createdAt = DateTime(2024, 3, 12);
final _updatedAt = DateTime(2024, 3, 13);

final _primaryLink = LinkWithTags(
  link: Link(
    id: 1,
    title: 'FUTURISM MANIFESTO 2024',
    url: 'https://manifesto.io/kinetic',
    domain: 'manifesto.io',
    description: 'Kinetic futurism reference.',
    sourceImageUrl: null,
    readingTime: '',
    isArchived: false,
    createdAt: _createdAt,
    updatedAt: _updatedAt,
  ),
  preview: LinkPreview(
    id: 1,
    linkId: 1,
    previewTitle: 'FUTURISM MANIFESTO 2024',
    previewDescription: 'Kinetic futurism reference.',
    imageUrl: null,
    imageLabel: 'SOURCE_PREVIEW.JPG',
    imageDimensions: '1240 x 800',
    fetchedAt: _updatedAt,
  ),
  tags: [
    Tag(id: 1, name: 'DESIGN', category: 'GENERAL', createdAt: _createdAt),
    Tag(id: 2, name: 'UI_DESIGN', category: 'GENERAL', createdAt: _createdAt),
  ],
);

final class _FakeLinkDataRepository
    implements FeedRepository, AddLinkRepository, LinkDetailsRepository {
  final _knownTags = <Tag>[
    ..._primaryLink.tags,
    Tag(
      id: 3,
      name: 'PERSISTED_DB',
      category: 'GENERAL',
      createdAt: _createdAt,
    ),
  ];

  @override
  Stream<List<LinkWithTags>> watchLinks({
    LinkFilters filters = const LinkFilters(),
  }) {
    return Stream.value([_primaryLink]);
  }

  @override
  Stream<List<Tag>> watchTags() => Stream.value(_knownTags);

  @override
  Stream<LinkWithTags?> watchLink(int? linkId) => Stream.value(_primaryLink);

  Stream<List<LinkWithTags>> watchResults(LinkFilters filters) {
    return Stream.value([_primaryLink]);
  }

  @override
  Future<int> create(LinkDraft draft, {AddLinkMetadata? metadata}) async => 1;

  @override
  Future<void> update(
    int id,
    LinkDraft draft, {
    AddLinkMetadata? metadata,
  }) async {}

  @override
  Future<void> delete(int id) async {}

  @override
  Future<void> ensureTagExists(String name) async {}

  @override
  Future<void> archiveLinks(Iterable<int> linkIds) async {}

  Stream<List<String>> watchAvailableDomains() {
    return Stream.value(['GITHUB.COM', 'MANIFESTO.IO', 'NOTION.SO']);
  }

  Stream<List<String>> watchAvailableTags() {
    return Stream.value(
      _knownTags.map((tag) => tag.name).toList(growable: false),
    );
  }
}

final class _FakeAddLinkMetadataRepository
    implements AddLinkMetadataRepository {
  const _FakeAddLinkMetadataRepository();

  @override
  Future<AddLinkMetadata> fetch(String rawUrl) async {
    return AddLinkMetadata(
      url: rawUrl,
      host: 'manifesto.io',
      title: 'Manifesto Preview',
      description: 'Kinetic futurism reference.',
      readingTime: 'READ_3_MIN',
    );
  }
}

final class _FakeCollectionsRepository implements CollectionsRepository {
  final _collection = Collection(
    id: 1,
    title: 'WORK_PROJECTS',
    type: 'PRIVATE',
    iconKey: 'folder',
    tagName: 'UTILITY',
    createdAt: _createdAt,
  );

  @override
  Stream<List<CollectionWithCount>> watchCollections() {
    return Stream.value([
      CollectionWithCount(collection: _collection, count: 4),
    ]);
  }

  @override
  Stream<Collection?> watchCollection(int id) {
    return Stream.value(id == _collection.id ? _collection : null);
  }

  @override
  Stream<List<LinkWithTags>> watchCollectionLinks(int collectionId) {
    return Stream.value(collectionId == _collection.id ? [_primaryLink] : []);
  }

  @override
  Stream<List<LinkWithTags>> watchAvailableLinks(int collectionId) {
    return Stream.value([]);
  }

  @override
  Stream<List<TagGroup>> watchCollectionTags() {
    return Stream.value([
      const TagGroup(id: 1, name: 'UTILITY', category: 'COLLECTION'),
    ]);
  }

  @override
  Stream<List<CollectionMetricPoint>> watchVelocityMetrics() {
    return Stream.value([
      const CollectionMetricPoint(label: 'M', value: 40),
      const CollectionMetricPoint(label: 'T', value: 70),
    ]);
  }

  @override
  Future<int> create(
    String title,
    String type,
    String iconKey, {
    String? tagName,
  }) async => 1;

  @override
  Future<void> update(
    int id,
    String title,
    String type,
    String iconKey, {
    String? tagName,
  }) async {}

  @override
  Future<void> delete(int id) async {}

  @override
  Future<void> addLink(int collectionId, int linkId) async {}

  @override
  Future<void> removeLink(int collectionId, int linkId) async {}
}

final class _FakeSystemDataRepository
    implements ProfileRepository, SettingsRepository, OnboardingRepository {
  @override
  Stream<ProfileSnapshot> watchProfile() {
    return Stream.value(
      ProfileSnapshot(
        profile: UserProfile(
          id: 1,
          displayName: 'USER_CORE',
          authLevel: 'AUTH_LEVEL_01',
          linksSaved: 1284,
          dataUsedMb: 42.8,
          storagePercent: .68,
          version: 'LINKVAULT_OS v2.4.0-STABLE',
          updatedAt: _updatedAt,
        ),
        metrics: [
          const ProfileMetric(
            id: 1,
            profileId: 1,
            label: 'M',
            value: 40,
            sortOrder: 0,
          ),
          const ProfileMetric(
            id: 2,
            profileId: 1,
            label: 'T',
            value: 70,
            sortOrder: 1,
          ),
        ],
      ),
    );
  }

  @override
  Stream<List<SettingOption>> watchSettings() {
    return Stream.value([
      const SettingOption(
        id: 1,
        section: 'ACCOUNT',
        title: 'Identity Profile',
        subtitle: 'Manage your digital signature',
        kind: 'row',
        iconKey: 'person',
        enabled: true,
      ),
    ]);
  }

  @override
  Stream<List<VaultOnboardingStep>> watchOnboardingSteps() {
    return Stream.value([
      const VaultOnboardingStep(
        id: 1,
        stepNumber: '01',
        title: 'CAPTURE_EVERYTHING',
        description: 'Capture links instantly.',
        iconKey: 'browser',
        showPlatforms: false,
      ),
    ]);
  }

  @override
  Stream<List<BrowserPlatformOption>> watchBrowserPlatforms() {
    return Stream.value([
      const BrowserPlatformOption(id: 1, name: 'CHROME', iconKey: 'public'),
    ]);
  }

  @override
  Future<void> updateSettingEnabled(int id, bool enabled) async {}

  @override
  Future<String> exportLinksCsv() async =>
      'url,title,description,tags,is_archived';

  @override
  Future<int> importLinksCsv(String csvContent) async => 0;

  @override
  Future<void> updateStoragePercent(double value) async {}
}
