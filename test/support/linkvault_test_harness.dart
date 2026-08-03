library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linkvault/app/app_router.dart';
import 'package:linkvault/app/linkvault_app.dart';
import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/add_link/provider/add_link_metadata_providers.dart';
import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/add_link/provider/shared_url_providers.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/add_link/repository/add_link_repository.dart';
import 'package:linkvault/features/add_link/service/shared_url_service.dart';
import 'package:linkvault/features/add_link/service/metadata_task_runner.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/domain/feed_query.dart';
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
import 'package:linkvault/features/settings/repository/app_preference_store.dart';
import 'package:linkvault/features/settings/repository/managed_tag.dart';
import 'package:linkvault/features/settings/repository/settings_repository.dart';
import 'package:linkvault/features/settings/service/csv_file_saver.dart';

import 'test_shared_url_service.dart';

part 'fake_collections_repository.dart';
part 'fake_app_preference_store.dart';
part 'fake_csv_file_saver.dart';
part 'fake_link_data_repository.dart';
part 'fake_system_data_repository.dart';
part 'secondary_link_fixture.dart';

extension WidgetTesterAppFrame on WidgetTester {
  Future<void> pumpLinkVault(
    String route, {
    SharedUrlService? sharedUrlService,
    bool hasCollections = true,
  }) async {
    final effectiveSharedUrlService =
        sharedUrlService ?? TestSharedUrlService.resolved(null);
    if (sharedUrlService == null) {
      addTearDown(effectiveSharedUrlService.dispose);
    }
    removedCollectionLinkIds.clear();
    restoredArchivedLinkIds.clear();
    deletedArchivedLinkIds.clear();
    restoredArchivedCollectionIds.clear();
    deletedArchivedCollectionIds.clear();
    deletedManagedLinkTags.clear();
    deletedManagedCollectionTags.clear();
    settingsEraseCount = 0;
    lastSavedCsv = null;
    lastCreatedLinkDraft = null;
    appRouter.go(route);
    await pumpWidget(
      ProviderScope(
        overrides: [
          seedDatabaseProvider.overrideWith((ref) async {}),
          metadataTaskRunnerProvider.overrideWith(
            (ref) => MetadataTaskRunner.disabled(),
          ),
          feedRepositoryProvider.overrideWith(
            (ref) => _FakeLinkDataRepository(),
          ),
          addLinkRepositoryProvider.overrideWith(
            (ref) => _FakeLinkDataRepository(),
          ),
          addLinkMetadataRepositoryProvider.overrideWith(
            (ref) => const _FakeAddLinkMetadataRepository(),
          ),
          sharedUrlServiceProvider.overrideWithValue(effectiveSharedUrlService),
          linkDetailsRepositoryProvider.overrideWith(
            (ref) => _FakeLinkDataRepository(),
          ),
          collectionsRepositoryProvider.overrideWith(
            (ref) => _FakeCollectionsRepository(hasCollections: hasCollections),
          ),
          profileRepositoryProvider.overrideWith(
            (ref) => _FakeSystemDataRepository(),
          ),
          settingsRepositoryProvider.overrideWith(
            (ref) => _FakeSystemDataRepository(),
          ),
          csvFileSaverProvider.overrideWithValue(_FakeCsvFileSaver()),
          appPreferenceStoreProvider.overrideWithValue(
            _FakeAppPreferenceStore(),
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

final createdAt = DateTime(2024, 3, 12);
final updatedAt = DateTime(2024, 3, 13);
final removedCollectionLinkIds = <int>[];
final restoredArchivedLinkIds = <int>[];
final deletedArchivedLinkIds = <int>[];
final restoredArchivedCollectionIds = <int>[];
final deletedArchivedCollectionIds = <int>[];
final deletedManagedLinkTags = <String>[];
final deletedManagedCollectionTags = <String>[];
var settingsEraseCount = 0;
String? lastSavedCsv;
LinkDraft? lastCreatedLinkDraft;

final primaryLink = LinkWithTags(
  link: Link(
    id: 1,
    title: 'FUTURISM MANIFESTO 2024',
    url: 'https://manifesto.io/kinetic',
    originalUrl: 'https://manifesto.io/kinetic',
    normalizedUrl: 'https://manifesto.io/kinetic',
    urlHash: 'fixture',
    domain: 'manifesto.io',
    description: 'Kinetic futurism reference.',
    note: '',
    readingTime: '',
    contentType: 'webpage',
    status: 'active',
    isFavourite: false,
    isPinned: false,
    isArchived: false,
    metadataStatus: 'completed',
    offlineStatus: 'unavailable',
    linkHealthStatus: 'unknown',
    manualSortOrder: 0,
    createdAt: createdAt,
    updatedAt: updatedAt,
  ),
  preview: LinkPreview(
    id: 1,
    linkId: 1,
    previewTitle: 'FUTURISM MANIFESTO 2024',
    previewDescription: 'Kinetic futurism reference.',
    imageLabel: 'SOURCE_PREVIEW.JPG',
    imageDimensions: '1240 x 800',
    fetchedAt: updatedAt,
  ),
  tags: [
    Tag(id: 1, name: 'DESIGN', category: 'GENERAL', createdAt: createdAt),
    Tag(id: 2, name: 'UI_DESIGN', category: 'GENERAL', createdAt: createdAt),
  ],
);

final class _FakeAddLinkMetadataRepository
    implements AddLinkMetadataRepository {
  const _FakeAddLinkMetadataRepository();

  @override
  Future<AddLinkMetadata> fetch(String rawUrl) async => AddLinkMetadata(
    url: rawUrl,
    host: 'manifesto.io',
    title: 'Manifesto Preview',
    description: 'Kinetic futurism reference.',
    readingTime: 'READ_3_MIN',
  );
}
