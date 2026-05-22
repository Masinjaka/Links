// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FeedSelectionMode)
final feedSelectionModeProvider = FeedSelectionModeProvider._();

final class FeedSelectionModeProvider
    extends $NotifierProvider<FeedSelectionMode, bool> {
  FeedSelectionModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedSelectionModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedSelectionModeHash();

  @$internal
  @override
  FeedSelectionMode create() => FeedSelectionMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$feedSelectionModeHash() => r'6f3960463e363980272e4c8215bb865246baaded';

abstract class _$FeedSelectionMode extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedFeedLinkIds)
final selectedFeedLinkIdsProvider = SelectedFeedLinkIdsProvider._();

final class SelectedFeedLinkIdsProvider
    extends $NotifierProvider<SelectedFeedLinkIds, Set<int>> {
  SelectedFeedLinkIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedFeedLinkIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedFeedLinkIdsHash();

  @$internal
  @override
  SelectedFeedLinkIds create() => SelectedFeedLinkIds();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$selectedFeedLinkIdsHash() =>
    r'5b173a87e2f288bb26d1a33944180e8092a2871c';

abstract class _$SelectedFeedLinkIds extends $Notifier<Set<int>> {
  Set<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<int>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<int>, Set<int>>,
              Set<int>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(feedRepository)
final feedRepositoryProvider = FeedRepositoryProvider._();

final class FeedRepositoryProvider
    extends $FunctionalProvider<FeedRepository, FeedRepository, FeedRepository>
    with $Provider<FeedRepository> {
  FeedRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedRepositoryHash();

  @$internal
  @override
  $ProviderElement<FeedRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FeedRepository create(Ref ref) {
    return feedRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedRepository>(value),
    );
  }
}

String _$feedRepositoryHash() => r'2136e2f934976efb24089648ceda4a0981a3b3ff';

@ProviderFor(feedLinks)
final feedLinksProvider = FeedLinksProvider._();

final class FeedLinksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LinkWithTags>>,
          List<LinkWithTags>,
          Stream<List<LinkWithTags>>
        >
    with
        $FutureModifier<List<LinkWithTags>>,
        $StreamProvider<List<LinkWithTags>> {
  FeedLinksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedLinksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedLinksHash();

  @$internal
  @override
  $StreamProviderElement<List<LinkWithTags>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<LinkWithTags>> create(Ref ref) {
    return feedLinks(ref);
  }
}

String _$feedLinksHash() => r'74b47b740244294424756876972c543c57a50b54';

@ProviderFor(feedFilters)
final feedFiltersProvider = FeedFiltersProvider._();

final class FeedFiltersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          AsyncValue<List<String>>,
          AsyncValue<List<String>>
        >
    with $Provider<AsyncValue<List<String>>> {
  FeedFiltersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedFiltersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedFiltersHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<String>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<String>> create(Ref ref) {
    return feedFilters(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<String>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<String>>>(value),
    );
  }
}

String _$feedFiltersHash() => r'ff1394a65784640b102dfb3954e24cc25bd806cf';

@ProviderFor(SelectedFeedFilter)
final selectedFeedFilterProvider = SelectedFeedFilterProvider._();

final class SelectedFeedFilterProvider
    extends $NotifierProvider<SelectedFeedFilter, String> {
  SelectedFeedFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedFeedFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedFeedFilterHash();

  @$internal
  @override
  SelectedFeedFilter create() => SelectedFeedFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedFeedFilterHash() =>
    r'e0b708b3a66592a99fd771e9d7f0d348eba49717';

abstract class _$SelectedFeedFilter extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(FeedSearchQuery)
final feedSearchQueryProvider = FeedSearchQueryProvider._();

final class FeedSearchQueryProvider
    extends $NotifierProvider<FeedSearchQuery, String> {
  FeedSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedSearchQueryHash();

  @$internal
  @override
  FeedSearchQuery create() => FeedSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$feedSearchQueryHash() => r'72f4691d11e7307b1ef6e0e2324f7a54703677d0';

abstract class _$FeedSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(visibleFeedLinks)
final visibleFeedLinksProvider = VisibleFeedLinksProvider._();

final class VisibleFeedLinksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LinkWithTags>>,
          AsyncValue<List<LinkWithTags>>,
          AsyncValue<List<LinkWithTags>>
        >
    with $Provider<AsyncValue<List<LinkWithTags>>> {
  VisibleFeedLinksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'visibleFeedLinksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$visibleFeedLinksHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<LinkWithTags>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<LinkWithTags>> create(Ref ref) {
    return visibleFeedLinks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<LinkWithTags>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<LinkWithTags>>>(
        value,
      ),
    );
  }
}

String _$visibleFeedLinksHash() => r'f3db244b0462da368968ae36e8affb4383216ede';
