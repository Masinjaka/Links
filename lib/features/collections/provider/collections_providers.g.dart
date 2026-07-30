// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(collectionsRepository)
final collectionsRepositoryProvider = CollectionsRepositoryProvider._();

final class CollectionsRepositoryProvider
    extends
        $FunctionalProvider<
          CollectionsRepository,
          CollectionsRepository,
          CollectionsRepository
        >
    with $Provider<CollectionsRepository> {
  CollectionsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionsRepositoryHash();

  @$internal
  @override
  $ProviderElement<CollectionsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CollectionsRepository create(Ref ref) {
    return collectionsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CollectionsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CollectionsRepository>(value),
    );
  }
}

String _$collectionsRepositoryHash() =>
    r'6616875156176c8d1e1453fb79fe2ed7497d1fb9';

@ProviderFor(collections)
final collectionsProvider = CollectionsProvider._();

final class CollectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CollectionWithCount>>,
          List<CollectionWithCount>,
          Stream<List<CollectionWithCount>>
        >
    with
        $FutureModifier<List<CollectionWithCount>>,
        $StreamProvider<List<CollectionWithCount>> {
  CollectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionsHash();

  @$internal
  @override
  $StreamProviderElement<List<CollectionWithCount>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CollectionWithCount>> create(Ref ref) {
    return collections(ref);
  }
}

String _$collectionsHash() => r'7c4b1392ca75e618b7f73e4cb54e6937aef13624';

@ProviderFor(collectionTags)
final collectionTagsProvider = CollectionTagsProvider._();

final class CollectionTagsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TagGroup>>,
          List<TagGroup>,
          Stream<List<TagGroup>>
        >
    with $FutureModifier<List<TagGroup>>, $StreamProvider<List<TagGroup>> {
  CollectionTagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionTagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionTagsHash();

  @$internal
  @override
  $StreamProviderElement<List<TagGroup>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TagGroup>> create(Ref ref) {
    return collectionTags(ref);
  }
}

String _$collectionTagsHash() => r'45ae77833412a5be32db1664c6fa64272d704ced';

@ProviderFor(collectionsVelocityMetrics)
final collectionsVelocityMetricsProvider =
    CollectionsVelocityMetricsProvider._();

final class CollectionsVelocityMetricsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CollectionMetricPoint>>,
          List<CollectionMetricPoint>,
          Stream<List<CollectionMetricPoint>>
        >
    with
        $FutureModifier<List<CollectionMetricPoint>>,
        $StreamProvider<List<CollectionMetricPoint>> {
  CollectionsVelocityMetricsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionsVelocityMetricsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionsVelocityMetricsHash();

  @$internal
  @override
  $StreamProviderElement<List<CollectionMetricPoint>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CollectionMetricPoint>> create(Ref ref) {
    return collectionsVelocityMetrics(ref);
  }
}

String _$collectionsVelocityMetricsHash() =>
    r'6e1e5850a52cf1ce7ea1c1319c2d708d43b9c291';

@ProviderFor(SelectedCollectionSort)
final selectedCollectionSortProvider = SelectedCollectionSortProvider._();

final class SelectedCollectionSortProvider
    extends $NotifierProvider<SelectedCollectionSort, CollectionSort> {
  SelectedCollectionSortProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCollectionSortProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCollectionSortHash();

  @$internal
  @override
  SelectedCollectionSort create() => SelectedCollectionSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CollectionSort value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CollectionSort>(value),
    );
  }
}

String _$selectedCollectionSortHash() =>
    r'5f9d90226dae1ca7726b1feb6b3e66bfca737610';

abstract class _$SelectedCollectionSort extends $Notifier<CollectionSort> {
  CollectionSort build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CollectionSort, CollectionSort>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CollectionSort, CollectionSort>,
              CollectionSort,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CollectionSelectionMode)
final collectionSelectionModeProvider = CollectionSelectionModeProvider._();

final class CollectionSelectionModeProvider
    extends $NotifierProvider<CollectionSelectionMode, bool> {
  CollectionSelectionModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionSelectionModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionSelectionModeHash();

  @$internal
  @override
  CollectionSelectionMode create() => CollectionSelectionMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$collectionSelectionModeHash() =>
    r'945fce4062e5512edc5efe267da895a5f7985791';

abstract class _$CollectionSelectionMode extends $Notifier<bool> {
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

@ProviderFor(SelectedCollectionIds)
final selectedCollectionIdsProvider = SelectedCollectionIdsProvider._();

final class SelectedCollectionIdsProvider
    extends $NotifierProvider<SelectedCollectionIds, Set<int>> {
  SelectedCollectionIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCollectionIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCollectionIdsHash();

  @$internal
  @override
  SelectedCollectionIds create() => SelectedCollectionIds();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$selectedCollectionIdsHash() =>
    r'987e450a740cfdc85c6cc2b209afb08143a8cbf3';

abstract class _$SelectedCollectionIds extends $Notifier<Set<int>> {
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

@ProviderFor(SelectedCollectionTag)
final selectedCollectionTagProvider = SelectedCollectionTagProvider._();

final class SelectedCollectionTagProvider
    extends $NotifierProvider<SelectedCollectionTag, String> {
  SelectedCollectionTagProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCollectionTagProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCollectionTagHash();

  @$internal
  @override
  SelectedCollectionTag create() => SelectedCollectionTag();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedCollectionTagHash() =>
    r'bb4605d114cc71a96591cf9915cec5ffa2c09065';

abstract class _$SelectedCollectionTag extends $Notifier<String> {
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

@ProviderFor(CollectionSearchQuery)
final collectionSearchQueryProvider = CollectionSearchQueryProvider._();

final class CollectionSearchQueryProvider
    extends $NotifierProvider<CollectionSearchQuery, String> {
  CollectionSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionSearchQueryHash();

  @$internal
  @override
  CollectionSearchQuery create() => CollectionSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$collectionSearchQueryHash() =>
    r'73fb5d9c47251d207b5e15187a0929b0c048a7d3';

abstract class _$CollectionSearchQuery extends $Notifier<String> {
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

@ProviderFor(collectionFilters)
final collectionFiltersProvider = CollectionFiltersProvider._();

final class CollectionFiltersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          AsyncValue<List<String>>,
          AsyncValue<List<String>>
        >
    with $Provider<AsyncValue<List<String>>> {
  CollectionFiltersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionFiltersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionFiltersHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<String>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<String>> create(Ref ref) {
    return collectionFilters(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<String>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<String>>>(value),
    );
  }
}

String _$collectionFiltersHash() => r'8f2a058b791d7d1a1590eb3c3b1cc3ed52ddf437';

@ProviderFor(visibleCollections)
final visibleCollectionsProvider = VisibleCollectionsProvider._();

final class VisibleCollectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CollectionWithCount>>,
          AsyncValue<List<CollectionWithCount>>,
          AsyncValue<List<CollectionWithCount>>
        >
    with $Provider<AsyncValue<List<CollectionWithCount>>> {
  VisibleCollectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'visibleCollectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$visibleCollectionsHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<CollectionWithCount>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<CollectionWithCount>> create(Ref ref) {
    return visibleCollections(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<CollectionWithCount>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncValue<List<CollectionWithCount>>>(value),
    );
  }
}

String _$visibleCollectionsHash() =>
    r'18301a884a23bc49d20898532121c6dbe8cf44fe';
