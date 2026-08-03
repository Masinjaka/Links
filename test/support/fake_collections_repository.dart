part of 'linkvault_test_harness.dart';

final class _FakeCollectionsRepository implements CollectionsRepository {
  _FakeCollectionsRepository({this.hasCollections = true});

  final bool hasCollections;

  final _collection = Collection(
    id: 1,
    title: 'WORK_PROJECTS',
    type: 'PRIVATE',
    iconKey: 'folder',
    tagName: 'UTILITY',
    isFavourite: false,
    isPinned: false,
    isArchived: false,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  @override
  Stream<List<CollectionWithCount>> watchCollections() {
    if (!hasCollections) return Stream.value(const []);
    return Stream.value([
      CollectionWithCount(collection: _collection, count: 4),
    ]);
  }

  @override
  Stream<List<CollectionWithCount>> watchArchivedCollections() {
    return Stream.value([
      CollectionWithCount(
        collection: _collection.copyWith(isArchived: true),
        count: 3,
      ),
    ]);
  }

  @override
  Stream<Collection?> watchCollection(int id) {
    return Stream.value(id == _collection.id ? _collection : null);
  }

  @override
  Stream<List<LinkWithTags>> watchCollectionLinks(int collectionId) {
    return Stream.value(
      collectionId == _collection.id ? [primaryLink, secondaryLink] : [],
    );
  }

  @override
  Stream<List<LinkWithTags>> watchAvailableLinks(int collectionId) {
    return Stream.value([primaryLink]);
  }

  @override
  Stream<List<TagGroup>> watchCollectionTags() {
    return Stream.value([
      const TagGroup(id: 1, name: 'UTILITY', category: 'COLLECTION'),
      const TagGroup(id: 2, name: 'ARCHIVE', category: 'COLLECTION'),
    ]);
  }

  @override
  Stream<List<CollectionMetricPoint>> watchVelocityMetrics() {
    return Stream.value([
      const CollectionMetricPoint(label: 'M', value: 40),
      const CollectionMetricPoint(label: 'T', value: 70),
    ]);
  }

  @override
  Future<int> create(
    String title,
    String type,
    String iconKey, {
    String? tagName,
  }) async => 1;

  @override
  Future<void> update(
    int id,
    String title,
    String type,
    String iconKey, {
    String? tagName,
  }) async {}

  @override
  Future<void> delete(int id) async {}

  @override
  Future<void> deletePermanently(Iterable<int> ids) async {
    deletedArchivedCollectionIds.addAll(ids);
  }

  @override
  Future<void> archive(Iterable<int> ids) async {}

  @override
  Future<void> restore(Iterable<int> ids) async {
    restoredArchivedCollectionIds.addAll(ids);
  }

  @override
  Future<void> setFavourite(int id, bool value) async {}

  @override
  Future<void> setPinned(int id, bool value) async {}

  @override
  Future<void> addLink(int collectionId, int linkId) async {}

  @override
  Future<void> removeLink(int collectionId, int linkId) async {
    removedCollectionLinkIds.add(linkId);
  }

  @override
  Future<void> removeLinks(int collectionId, Iterable<int> linkIds) async {
    removedCollectionLinkIds.addAll(linkIds);
  }
}
