import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/feed/repository/link_repository_utils.dart';

class CollectionWithCount {
  const CollectionWithCount({required this.collection, required this.count});

  final Collection collection;
  final int count;
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
  Future<void> addLink(int collectionId, int linkId);
  Future<void> removeLink(int collectionId, int linkId);
}

class DriftCollectionsRepository implements CollectionsRepository {
  const DriftCollectionsRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<CollectionWithCount>> watchCollections() {
    final query = _db.select(_db.collections)
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.id)]);

    return query.watch().asyncMap((rows) async {
      return Future.wait(
        rows.map((collection) async {
          final links = await (_db.select(
            _db.collectionLinks,
          )..where((tbl) => tbl.collectionId.equals(collection.id))).get();

          return CollectionWithCount(
            collection: collection,
            count: links.length,
          );
        }),
      );
    });
  }

  @override
  Stream<Collection?> watchCollection(int id) {
    final query = _db.select(_db.collections)
      ..where((tbl) => tbl.id.equals(id));
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
          ..where(_db.links.isArchived.equals(false))
          ..orderBy([OrderingTerm.desc(_db.links.createdAt)]);

    return query.watch().asyncMap((rows) {
      return Future.wait(
        rows.map((row) => hydrateLink(_db, row.readTable(_db.links))),
      );
    });
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
          ..where(_db.links.isArchived.equals(false))
          ..where(_db.collectionLinks.linkId.isNull())
          ..orderBy([OrderingTerm.desc(_db.links.createdAt)]);

    return query.watch().asyncMap((rows) {
      return Future.wait(
        rows.map((row) => hydrateLink(_db, row.readTable(_db.links))),
      );
    });
  }

  @override
  Stream<List<TagGroup>> watchCollectionTags() {
    final query = _db.select(_db.collections)
      ..where((tbl) => tbl.tagName.isNotValue(''))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.tagName)]);

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
    final profileQuery = _db.select(_db.userProfiles)..limit(1);

    return profileQuery.watchSingle().asyncMap((profile) async {
      final rows =
          await (_db.select(_db.profileMetrics)
                ..where((tbl) => tbl.profileId.equals(profile.id))
                ..orderBy([(tbl) => OrderingTerm.asc(tbl.sortOrder)]))
              .get();

      return [
        for (final row in rows)
          CollectionMetricPoint(label: row.label, value: row.value),
      ];
    });
  }

  @override
  Future<int> create(
    String title,
    String type,
    String iconKey, {
    String? tagName,
  }) {
    return _db
        .into(_db.collections)
        .insert(
          CollectionsCompanion.insert(
            title: title.trim().toUpperCase(),
            type: type.trim().toUpperCase(),
            iconKey: Value(iconKey),
            tagName: Value(tagName?.trim().toUpperCase() ?? ''),
          ),
        );
  }

  @override
  Future<void> update(
    int id,
    String title,
    String type,
    String iconKey, {
    String? tagName,
  }) {
    return (_db.update(
      _db.collections,
    )..where((tbl) => tbl.id.equals(id))).write(
      CollectionsCompanion(
        title: Value(title.trim().toUpperCase()),
        type: Value(type.trim().toUpperCase()),
        iconKey: Value(iconKey),
        tagName: Value(tagName?.trim().toUpperCase() ?? ''),
      ),
    );
  }

  @override
  Future<void> delete(int id) {
    return (_db.delete(
      _db.collections,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<void> addLink(int collectionId, int linkId) {
    return _db
        .into(_db.collectionLinks)
        .insert(
          CollectionLinksCompanion.insert(
            collectionId: collectionId,
            linkId: linkId,
          ),
          mode: InsertMode.insertOrIgnore,
        );
  }

  @override
  Future<void> removeLink(int collectionId, int linkId) {
    return (_db.delete(_db.collectionLinks)
          ..where((tbl) => tbl.collectionId.equals(collectionId))
          ..where((tbl) => tbl.linkId.equals(linkId)))
        .go();
  }
}
