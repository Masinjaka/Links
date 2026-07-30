// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsRepository)
final settingsRepositoryProvider = SettingsRepositoryProvider._();

final class SettingsRepositoryProvider
    extends
        $FunctionalProvider<
          SettingsRepository,
          SettingsRepository,
          SettingsRepository
        >
    with $Provider<SettingsRepository> {
  SettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingsRepository create(Ref ref) {
    return settingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepository>(value),
    );
  }
}

String _$settingsRepositoryHash() =>
    r'a69d11b66dc0d826953593045b4f011044931d9e';

@ProviderFor(appPreferenceStore)
final appPreferenceStoreProvider = AppPreferenceStoreProvider._();

final class AppPreferenceStoreProvider
    extends
        $FunctionalProvider<
          AppPreferenceStore,
          AppPreferenceStore,
          AppPreferenceStore
        >
    with $Provider<AppPreferenceStore> {
  AppPreferenceStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appPreferenceStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appPreferenceStoreHash();

  @$internal
  @override
  $ProviderElement<AppPreferenceStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppPreferenceStore create(Ref ref) {
    return appPreferenceStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppPreferenceStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppPreferenceStore>(value),
    );
  }
}

String _$appPreferenceStoreHash() =>
    r'2c56ce0c5098d25af9d6273465054e2dc3a99bea';

@ProviderFor(settings)
final settingsProvider = SettingsProvider._();

final class SettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SettingOption>>,
          List<SettingOption>,
          Stream<List<SettingOption>>
        >
    with
        $FutureModifier<List<SettingOption>>,
        $StreamProvider<List<SettingOption>> {
  SettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsHash();

  @$internal
  @override
  $StreamProviderElement<List<SettingOption>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SettingOption>> create(Ref ref) {
    return settings(ref);
  }
}

String _$settingsHash() => r'e589a965c81ab861682518845e1bed30f78c8ec9';

@ProviderFor(installedAppVersion)
final installedAppVersionProvider = InstalledAppVersionProvider._();

final class InstalledAppVersionProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  InstalledAppVersionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'installedAppVersionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$installedAppVersionHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return installedAppVersion(ref);
  }
}

String _$installedAppVersionHash() =>
    r'c4fed2f470d4b63b56a13fdb5608516f9a3cad22';

@ProviderFor(SelectedAppThemePreference)
final selectedAppThemePreferenceProvider =
    SelectedAppThemePreferenceProvider._();

final class SelectedAppThemePreferenceProvider
    extends $NotifierProvider<SelectedAppThemePreference, AppThemePreference> {
  SelectedAppThemePreferenceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAppThemePreferenceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAppThemePreferenceHash();

  @$internal
  @override
  SelectedAppThemePreference create() => SelectedAppThemePreference();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppThemePreference value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppThemePreference>(value),
    );
  }
}

String _$selectedAppThemePreferenceHash() =>
    r'a4dcdb9f02f15e0bdb5018074167cdadc9636cf9';

abstract class _$SelectedAppThemePreference
    extends $Notifier<AppThemePreference> {
  AppThemePreference build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppThemePreference, AppThemePreference>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppThemePreference, AppThemePreference>,
              AppThemePreference,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedAccentTone)
final selectedAccentToneProvider = SelectedAccentToneProvider._();

final class SelectedAccentToneProvider
    extends $NotifierProvider<SelectedAccentTone, AppAccentTone> {
  SelectedAccentToneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAccentToneProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAccentToneHash();

  @$internal
  @override
  SelectedAccentTone create() => SelectedAccentTone();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppAccentTone value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppAccentTone>(value),
    );
  }
}

String _$selectedAccentToneHash() =>
    r'a6f84f2cd55e9ae12920b44ff557d56285745bd9';

abstract class _$SelectedAccentTone extends $Notifier<AppAccentTone> {
  AppAccentTone build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppAccentTone, AppAccentTone>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppAccentTone, AppAccentTone>,
              AppAccentTone,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedAppLanguage)
final selectedAppLanguageProvider = SelectedAppLanguageProvider._();

final class SelectedAppLanguageProvider
    extends $NotifierProvider<SelectedAppLanguage, AppLanguage> {
  SelectedAppLanguageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAppLanguageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAppLanguageHash();

  @$internal
  @override
  SelectedAppLanguage create() => SelectedAppLanguage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLanguage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLanguage>(value),
    );
  }
}

String _$selectedAppLanguageHash() =>
    r'4f6135caf2dc278fb26c63d05dc4a83fbfa3b0ee';

abstract class _$SelectedAppLanguage extends $Notifier<AppLanguage> {
  AppLanguage build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppLanguage, AppLanguage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLanguage, AppLanguage>,
              AppLanguage,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
