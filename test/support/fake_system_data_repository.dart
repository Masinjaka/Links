part of 'linkvault_test_harness.dart';

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
          updatedAt: updatedAt,
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
  Future<String> exportLinksCsv() async {
    return 'url,title,description,tags,is_archived';
  }

  @override
  Future<int> importLinksCsv(String csvContent) async {
    lastImportedCsv = csvContent;
    return 0;
  }

  @override
  Future<void> eraseAllData() async {
    settingsEraseCount += 1;
  }

  @override
  Stream<List<ManagedTag>> watchLinkTags() {
    return Stream.value(const [
      ManagedTag(name: 'DESIGN', usageCount: 2),
      ManagedTag(name: 'CULTURE', usageCount: 1),
    ]);
  }

  @override
  Stream<List<ManagedTag>> watchCollectionTags() {
    return Stream.value(const [
      ManagedTag(name: 'DEVELOPMENT', usageCount: 2),
      ManagedTag(name: 'WORK', usageCount: 1),
    ]);
  }

  @override
  Future<void> deleteLinkTags(Iterable<String> names) async {
    deletedManagedLinkTags.addAll(names);
  }

  @override
  Future<void> deleteCollectionTags(Iterable<String> names) async {
    deletedManagedCollectionTags.addAll(names);
  }

  @override
  Future<void> updateStoragePercent(double value) async {}
}
