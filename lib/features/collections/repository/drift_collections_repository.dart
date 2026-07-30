import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/collections/repository/collection_card_preview_reader.dart';
import 'package:linkvault/features/collections/repository/collection_mutation_writer.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/feed/repository/link_repository_utils.dart';

class DriftCollectionsRepository
    with DriftCollectionMutationWriter
    implements CollectionsRepository {
  const DriftCollectionsRepository(this._db);

  final AppDatabase _db;

  @override
  AppDatabase get database => _db;

  @override
  Stream<List<CollectionWithCount>> watchCollections() {
    return _watchCollections(archived: false);
  }

  @override
  Stream<List<CollectionWithCount>> watchArchivedCollections() {
    return _watchCollections(archived: true);
  }

  Stream<List<CollectionWithCount>> _watchCollections({
    required bool archived,
  }) {
    final query =
        _db.select(_db.collections).join([
            leftOuterJoin(
              _db.collectionLinks,
              _db.collectionLinks.collectionId.equalsExp(_db.collections.id),
            ),
            leftOuterJoin(
              _db.links,
              _db.links.id.equalsExp(_db.collectionLinks.linkId),
            ),
            leftOuterJoin(
              _db.linkPreviews,
              _db.linkPreviews.linkId.equalsExp(_db.collectionLinks.linkId),
            ),
          ])
          ..where(_db.collections.isArchived.equals(archived))
          ..orderBy([
            OrderingTerm.asc(_db.collections.id),
            OrderingTerm.desc(_db.links.createdAt),
          ]);

    return query.watch().map((rows) {
      final cardData = buildCollectionCardData(_db, rows);
      final collections = <int, Collection>{};
      for (final row in rows) {
        final collection = row.readTable(_db.collections);
        collections[collection.id] = collection;
      }
      return [
        for (final collection in collections.values)
          CollectionWithCount(
            collection: collection,
            count: cardData[collection.id]?.count ?? 0,
            previewImageUrls: cardData[collection.id]?.imageUrls ?? const [],
            description: cardData[collection.id]?.description ?? '',
          ),
      ];
    });
  }

  @override
  Stream<Collection?> watchCollection(int id) {
    final query = _db.select(_db.collections)
      ..where((table) => table.id.equals(id));
    return query.watchSingleOrNull();
  }

  @override
  Stream<List<LinkWithTags>> watchCollectionLinks(int collectionId) {
    final query =
        _db.select(_db.collectionLinks).join([
            innerJoin(
              _db.links,
              _db.links.id.equalsExp(_db.collectionLinks.linkId),
            ),
          ])
          ..where(_db.collectionLinks.collectionId.equals(collectionId))
          ..where(_db.links.status.isIn(['active', 'inbox']))
          ..orderBy([OrderingTerm.desc(_db.links.createdAt)]);
    return query.watch().asyncMap(
      (rows) => Future.wait(
        rows.map((row) => hydrateLink(_db, row.readTable(_db.links))),
      ),
    );
  }

  @override
  Stream<List<LinkWithTags>> watchAvailableLinks(int _) {
    final query =
        _db.select(_db.links).join([
            leftOuterJoin(
              _db.collectionLinks,
              _db.collectionLinks.linkId.equalsExp(_db.links.id),
            ),
          ])
          ..where(_db.links.status.isIn(['active', 'inbox']))
          ..where(_db.collectionLinks.linkId.isNull())
          ..orderBy([OrderingTerm.desc(_db.links.createdAt)]);
    return query.watch().asyncMap(
      (rows) => Future.wait(
        rows.map((row) => hydrateLink(_db, row.readTable(_db.links))),
      ),
    );
  }

  @override
  Stream<List<TagGroup>> watchCollectionTags() {
    final query = _db.select(_db.collections)
      ..where((table) => table.isArchived.equals(false))
      ..where((table) => table.tagName.isNotValue(''))
      ..orderBy([(table) => OrderingTerm.asc(table.tagName)]);
    return query.watch().map((collections) {
      final names = <String>{};
      return [
        for (final collection in collections)
          if (names.add(collection.tagName))
            TagGroup(
              id: collection.id,
              name: collection.tagName,
              category: 'COLLECTION',
            ),
      ];
    });
  }

  @override
  Stream<List<CollectionMetricPoint>> watchVelocityMetrics() {
    final query = _db.select(_db.userProfiles)..limit(1);
    return query.watchSingle().asyncMap((profile) async {
      final rows =
          await (_db.select(_db.profileMetrics)
                ..where((table) => table.profileId.equals(profile.id))
                ..orderBy([(table) => OrderingTerm.asc(table.sortOrder)]))
              .get();
      return [
        for (final row in rows)
          CollectionMetricPoint(label: row.label, value: row.value),
      ];
    });
  }
}
