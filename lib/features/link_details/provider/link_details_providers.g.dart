// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_details_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(linkDetailsRepository)
final linkDetailsRepositoryProvider = LinkDetailsRepositoryProvider._();

final class LinkDetailsRepositoryProvider
    extends
        $FunctionalProvider<
          LinkDetailsRepository,
          LinkDetailsRepository,
          LinkDetailsRepository
        >
    with $Provider<LinkDetailsRepository> {
  LinkDetailsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'linkDetailsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$linkDetailsRepositoryHash();

  @$internal
  @override
  $ProviderElement<LinkDetailsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LinkDetailsRepository create(Ref ref) {
    return linkDetailsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LinkDetailsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LinkDetailsRepository>(value),
    );
  }
}

String _$linkDetailsRepositoryHash() =>
    r'd7117c5b29bdbf77ccfe46c8a17303bcd4f6c805';

@ProviderFor(linkDetails)
final linkDetailsProvider = LinkDetailsFamily._();

final class LinkDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<LinkWithTags?>,
          LinkWithTags?,
          Stream<LinkWithTags?>
        >
    with $FutureModifier<LinkWithTags?>, $StreamProvider<LinkWithTags?> {
  LinkDetailsProvider._({
    required LinkDetailsFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'linkDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$linkDetailsHash();

  @override
  String toString() {
    return r'linkDetailsProvider'
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
    return linkDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LinkDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$linkDetailsHash() => r'217aa02b153b53346e7d1386a20fbe61eda421a9';

final class LinkDetailsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<LinkWithTags?>, int?> {
  LinkDetailsFamily._()
    : super(
        retry: null,
        name: r'linkDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LinkDetailsProvider call(int? linkId) =>
      LinkDetailsProvider._(argument: linkId, from: this);

  @override
  String toString() => r'linkDetailsProvider';
}
