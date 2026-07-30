part of 'app_database.dart';

extension AppDatabaseSeed on AppDatabase {
  Future<void> seedIfEmpty() async {
    final initialized =
        await _hasAnyRows(tags) ||
        await _hasAnyRows(collections) ||
        await _hasAnyRows(userProfiles) ||
        await _hasAnyRows(settingItems) ||
        await _hasAnyRows(onboardingSteps) ||
        await _hasAnyRows(browserPlatforms) ||
        await _hasAnyRows(links);
    if (initialized) return;

    await transaction(() async {
      final tagIds = <String, int>{};
      for (final tag in _seedTags) {
        tagIds[tag] = await into(tags).insert(TagsCompanion.insert(name: tag));
      }

      final firstLinkId = await _insertSeedLink(_seedLinks.first, tagIds);
      for (final link in _seedLinks.skip(1)) {
        await _insertSeedLink(link, tagIds);
      }

      for (final item in _seedCollections) {
        final collectionId = await into(collections).insert(
          CollectionsCompanion.insert(
            title: item.$1,
            type: item.$2,
            iconKey: Value(item.$3),
            tagName: Value(item.$4),
          ),
        );
        await into(collectionLinks).insert(
          CollectionLinksCompanion.insert(
            collectionId: collectionId,
            linkId: firstLinkId,
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
    await rebuildSearchIndex();
  }

  Future<bool> _hasAnyRows<T extends Table, D>(TableInfo<T, D> table) async {
    final row = await customSelect(
      'SELECT EXISTS(SELECT 1 FROM "${table.actualTableName}" LIMIT 1) AS value',
    ).getSingle();
    return row.read<int>('value') == 1;
  }

  Future<int> _insertSeedLink(_SeedLink seed, Map<String, int> tagIds) async {
    final linkId = await into(links).insert(
      LinksCompanion.insert(
        title: seed.title,
        url: seed.url,
        originalUrl: Value(seed.url),
        normalizedUrl: Value(seed.url.toLowerCase()),
        urlHash: Value(seed.url.toLowerCase()),
        domain: seed.domain,
        description: Value(seed.description),
        status: const Value('active'),
        metadataStatus: const Value('completed'),
        metadataFetchedAt: Value(seed.createdAt),
        createdAt: Value(seed.createdAt),
        updatedAt: Value(seed.createdAt),
      ),
    );
    await into(linkPreviews).insert(
      LinkPreviewsCompanion.insert(
        linkId: linkId,
        previewTitle: seed.title,
        previewDescription: Value(seed.description),
      ),
    );
    for (final tag in seed.tags) {
      final tagId = tagIds[tag]!;
      await into(
        linkTags,
      ).insert(LinkTagsCompanion.insert(linkId: linkId, tagId: tagId));
    }
    return linkId;
  }
}
