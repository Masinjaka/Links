// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onboardingRepository)
final onboardingRepositoryProvider = OnboardingRepositoryProvider._();

final class OnboardingRepositoryProvider
    extends
        $FunctionalProvider<
          OnboardingRepository,
          OnboardingRepository,
          OnboardingRepository
        >
    with $Provider<OnboardingRepository> {
  OnboardingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingRepositoryHash();

  @$internal
  @override
  $ProviderElement<OnboardingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingRepository create(Ref ref) {
    return onboardingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingRepository>(value),
    );
  }
}

String _$onboardingRepositoryHash() =>
    r'f313b643e1d79873c8e6d7e37da8e41ad264da91';

@ProviderFor(onboardingSteps)
final onboardingStepsProvider = OnboardingStepsProvider._();

final class OnboardingStepsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VaultOnboardingStep>>,
          List<VaultOnboardingStep>,
          Stream<List<VaultOnboardingStep>>
        >
    with
        $FutureModifier<List<VaultOnboardingStep>>,
        $StreamProvider<List<VaultOnboardingStep>> {
  OnboardingStepsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingStepsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingStepsHash();

  @$internal
  @override
  $StreamProviderElement<List<VaultOnboardingStep>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<VaultOnboardingStep>> create(Ref ref) {
    return onboardingSteps(ref);
  }
}

String _$onboardingStepsHash() => r'253a5d34e9c858ed2cba2fc081e3306bd9371527';

@ProviderFor(browserPlatforms)
final browserPlatformsProvider = BrowserPlatformsProvider._();

final class BrowserPlatformsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BrowserPlatformOption>>,
          List<BrowserPlatformOption>,
          Stream<List<BrowserPlatformOption>>
        >
    with
        $FutureModifier<List<BrowserPlatformOption>>,
        $StreamProvider<List<BrowserPlatformOption>> {
  BrowserPlatformsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'browserPlatformsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$browserPlatformsHash();

  @$internal
  @override
  $StreamProviderElement<List<BrowserPlatformOption>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<BrowserPlatformOption>> create(Ref ref) {
    return browserPlatforms(ref);
  }
}

String _$browserPlatformsHash() => r'6ae01de49b0efc90fd35cbe4bdcebd68ebb007da';
