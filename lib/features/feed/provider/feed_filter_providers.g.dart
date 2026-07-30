// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_filter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdvancedFeedFilterState)
final advancedFeedFilterStateProvider = AdvancedFeedFilterStateProvider._();

final class AdvancedFeedFilterStateProvider
    extends $NotifierProvider<AdvancedFeedFilterState, AdvancedFeedFilters> {
  AdvancedFeedFilterStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'advancedFeedFilterStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$advancedFeedFilterStateHash();

  @$internal
  @override
  AdvancedFeedFilterState create() => AdvancedFeedFilterState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdvancedFeedFilters value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdvancedFeedFilters>(value),
    );
  }
}

String _$advancedFeedFilterStateHash() =>
    r'903d831802cb035a39c957556f7c3588e1496147';

abstract class _$AdvancedFeedFilterState
    extends $Notifier<AdvancedFeedFilters> {
  AdvancedFeedFilters build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AdvancedFeedFilters, AdvancedFeedFilters>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AdvancedFeedFilters, AdvancedFeedFilters>,
              AdvancedFeedFilters,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
