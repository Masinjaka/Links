// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_link_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addLinkRepository)
final addLinkRepositoryProvider = AddLinkRepositoryProvider._();

final class AddLinkRepositoryProvider
    extends
        $FunctionalProvider<
          AddLinkRepository,
          AddLinkRepository,
          AddLinkRepository
        >
    with $Provider<AddLinkRepository> {
  AddLinkRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addLinkRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addLinkRepositoryHash();

  @$internal
  @override
  $ProviderElement<AddLinkRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddLinkRepository create(Ref ref) {
    return addLinkRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddLinkRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddLinkRepository>(value),
    );
  }
}

String _$addLinkRepositoryHash() => r'e6ab4d085c2dead27744a5bed937d4316f4c7ef1';

@ProviderFor(AddLinkOptimisticTags)
final addLinkOptimisticTagsProvider = AddLinkOptimisticTagsProvider._();

final class AddLinkOptimisticTagsProvider
    extends $NotifierProvider<AddLinkOptimisticTags, Set<String>> {
  AddLinkOptimisticTagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addLinkOptimisticTagsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addLinkOptimisticTagsHash();

  @$internal
  @override
  AddLinkOptimisticTags create() => AddLinkOptimisticTags();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$addLinkOptimisticTagsHash() =>
    r'fb549c7020d513427cfc0619a6efc2637b9b62bf';

abstract class _$AddLinkOptimisticTags extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(addLinkAvailableTags)
final addLinkAvailableTagsProvider = AddLinkAvailableTagsProvider._();

final class AddLinkAvailableTagsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          Stream<List<String>>
        >
    with $FutureModifier<List<String>>, $StreamProvider<List<String>> {
  AddLinkAvailableTagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addLinkAvailableTagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addLinkAvailableTagsHash();

  @$internal
  @override
  $StreamProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<String>> create(Ref ref) {
    return addLinkAvailableTags(ref);
  }
}

String _$addLinkAvailableTagsHash() =>
    r'eb5d6a9290b577f993c8b1b926427d81beb482fb';

@ProviderFor(addLinkEditingLink)
final addLinkEditingLinkProvider = AddLinkEditingLinkFamily._();

final class AddLinkEditingLinkProvider
    extends
        $FunctionalProvider<
          AsyncValue<LinkWithTags?>,
          LinkWithTags?,
          Stream<LinkWithTags?>
        >
    with $FutureModifier<LinkWithTags?>, $StreamProvider<LinkWithTags?> {
  AddLinkEditingLinkProvider._({
    required AddLinkEditingLinkFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'addLinkEditingLinkProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$addLinkEditingLinkHash();

  @override
  String toString() {
    return r'addLinkEditingLinkProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<LinkWithTags?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<LinkWithTags?> create(Ref ref) {
    final argument = this.argument as int?;
    return addLinkEditingLink(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AddLinkEditingLinkProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addLinkEditingLinkHash() =>
    r'e837a174b2d98f3ad7a9d28e8771e53e6937bafc';

final class AddLinkEditingLinkFamily extends $Family
    with $FunctionalFamilyOverride<Stream<LinkWithTags?>, int?> {
  AddLinkEditingLinkFamily._()
    : super(
        retry: null,
        name: r'addLinkEditingLinkProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AddLinkEditingLinkProvider call(int? linkId) =>
      AddLinkEditingLinkProvider._(argument: linkId, from: this);

  @override
  String toString() => r'addLinkEditingLinkProvider';
}
