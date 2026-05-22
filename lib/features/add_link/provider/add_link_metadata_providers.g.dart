// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_link_metadata_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addLinkDio)
final addLinkDioProvider = AddLinkDioProvider._();

final class AddLinkDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  AddLinkDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addLinkDioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addLinkDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return addLinkDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$addLinkDioHash() => r'53824bda12605db2018136b3cc023580609ab1c7';

@ProviderFor(addLinkMetadataRepository)
final addLinkMetadataRepositoryProvider = AddLinkMetadataRepositoryProvider._();

final class AddLinkMetadataRepositoryProvider
    extends
        $FunctionalProvider<
          AddLinkMetadataRepository,
          AddLinkMetadataRepository,
          AddLinkMetadataRepository
        >
    with $Provider<AddLinkMetadataRepository> {
  AddLinkMetadataRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addLinkMetadataRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addLinkMetadataRepositoryHash();

  @$internal
  @override
  $ProviderElement<AddLinkMetadataRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddLinkMetadataRepository create(Ref ref) {
    return addLinkMetadataRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddLinkMetadataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddLinkMetadataRepository>(value),
    );
  }
}

String _$addLinkMetadataRepositoryHash() =>
    r'5d7f929349464f4bd15dc03cd5723eadfdc6dc54';

@ProviderFor(AddLinkUrlDraft)
final addLinkUrlDraftProvider = AddLinkUrlDraftProvider._();

final class AddLinkUrlDraftProvider
    extends $NotifierProvider<AddLinkUrlDraft, String> {
  AddLinkUrlDraftProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addLinkUrlDraftProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addLinkUrlDraftHash();

  @$internal
  @override
  AddLinkUrlDraft create() => AddLinkUrlDraft();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$addLinkUrlDraftHash() => r'8ccc911845144e419b92d6b9cf2a99bbf81668f4';

abstract class _$AddLinkUrlDraft extends $Notifier<String> {
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

@ProviderFor(addLinkLivePreview)
final addLinkLivePreviewProvider = AddLinkLivePreviewProvider._();

final class AddLinkLivePreviewProvider
    extends
        $FunctionalProvider<
          AsyncValue<AddLinkMetadata?>,
          AddLinkMetadata?,
          FutureOr<AddLinkMetadata?>
        >
    with $FutureModifier<AddLinkMetadata?>, $FutureProvider<AddLinkMetadata?> {
  AddLinkLivePreviewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addLinkLivePreviewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addLinkLivePreviewHash();

  @$internal
  @override
  $FutureProviderElement<AddLinkMetadata?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AddLinkMetadata?> create(Ref ref) {
    return addLinkLivePreview(ref);
  }
}

String _$addLinkLivePreviewHash() =>
    r'ac134e3add0d4aa952db8c1a54f3232d1f6af795';
