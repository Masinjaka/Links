import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

class CollectionWithCount {
  const CollectionWithCount({
    required this.collection,
    required this.count,
    this.previewImageUrls = const [],
    this.description = '',
  });

  final Collection collection;
  final int count;
  final List<String?> previewImageUrls;
  final String description;
}

class TagGroup {
  const TagGroup({
    required this.id,
    required this.name,
    required this.category,
  });

  final int id;
  final String name;
  final String category;
}

class CollectionMetricPoint {
  const CollectionMetricPoint({required this.label, required this.value});

  final String label;
  final double value;
}

abstract interface class CollectionsRepository {
  Stream<List<CollectionWithCount>> watchCollections();
  Stream<List<CollectionWithCount>> watchArchivedCollections();
  Stream<Collection?> watchCollection(int id);
  Stream<List<LinkWithTags>> watchCollectionLinks(int collectionId);
  Stream<List<LinkWithTags>> watchAvailableLinks(int collectionId);
  Stream<List<TagGroup>> watchCollectionTags();
  Stream<List<CollectionMetricPoint>> watchVelocityMetrics();
  Future<int> create(
    String title,
    String type,
    String iconKey, {
    String? tagName,
  });
  Future<void> update(
    int id,
    String title,
    String type,
    String iconKey, {
    String? tagName,
  });
  Future<void> delete(int id);
  Future<void> deletePermanently(Iterable<int> ids);
  Future<void> archive(Iterable<int> ids);
  Future<void> restore(Iterable<int> ids);
  Future<void> setFavourite(int id, bool value);
  Future<void> setPinned(int id, bool value);
  Future<void> addLink(int collectionId, int linkId);
  Future<void> removeLink(int collectionId, int linkId);
  Future<void> removeLinks(int collectionId, Iterable<int> linkIds);
}
