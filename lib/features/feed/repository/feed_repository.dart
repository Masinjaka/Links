import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/feed/repository/link_repository_utils.dart';

abstract interface class FeedRepository {
  Stream<List<LinkWithTags>> watchLinks();
  Stream<List<Tag>> watchTags();
  Future<void> archiveLinks(Iterable<int> linkIds);
}

class DriftFeedRepository implements FeedRepository {
  const DriftFeedRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<LinkWithTags>> watchLinks() {
    final query = _db.select(_db.links)
      ..where((tbl) => tbl.isArchived.equals(false))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]);

    return query.watch().asyncMap((rows) {
      return Future.wait(rows.map((link) => hydrateLink(_db, link)));
    });
  }

  @override
  Stream<List<Tag>> watchTags() {
    final query = _db.select(_db.tags)
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]);

    return query.watch();
  }

  @override
  Future<void> archiveLinks(Iterable<int> linkIds) async {
    final ids = linkIds.toSet().toList(growable: false);
    if (ids.isEmpty) {
      return;
    }

    await (_db.update(_db.links)..where((tbl) => tbl.id.isIn(ids))).write(
      const LinksCompanion(isArchived: Value(true)),
    );
  }
}
