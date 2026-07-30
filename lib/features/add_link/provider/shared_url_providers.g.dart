// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_url_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedUrlService)
final sharedUrlServiceProvider = SharedUrlServiceProvider._();

final class SharedUrlServiceProvider
    extends
        $FunctionalProvider<
          SharedUrlService,
          SharedUrlService,
          SharedUrlService
        >
    with $Provider<SharedUrlService> {
  SharedUrlServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedUrlServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedUrlServiceHash();

  @$internal
  @override
  $ProviderElement<SharedUrlService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SharedUrlService create(Ref ref) {
    return sharedUrlService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedUrlService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedUrlService>(value),
    );
  }
}

String _$sharedUrlServiceHash() => r'5674f0d671adbda5c5e5be4913fa9dfbdbb7e71a';
