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
      await into(userProfiles).insert(UserProfilesCompanion.insert());

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
}
