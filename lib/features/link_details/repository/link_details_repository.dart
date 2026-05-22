import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/feed/repository/link_repository_utils.dart';

abstract interface class LinkDetailsRepository {
  Stream<LinkWithTags?> watchLink(int? linkId);
  Future<void> archive(int id);
}

class DriftLinkDetailsRepository implements LinkDetailsRepository {
  const DriftLinkDetailsRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<LinkWithTags?> watchLink(int? linkId) {
    if (linkId != null) {
      final query = _db.select(_db.links)
        ..where((tbl) => tbl.id.equals(linkId));
      return query.watchSingleOrNull().asyncMap((link) async {
        if (link == null) {
          return null;
        }

        return hydrateLink(_db, link);
      });
    }

    final query = _db.select(_db.links)
      ..where((tbl) => tbl.isArchived.equals(false))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])
      ..limit(1);

    return query.watchSingleOrNull().asyncMap((link) async {
      if (link == null) {
        return null;
      }

      return hydrateLink(_db, link);
    });
  }

  @override
  Future<void> archive(int id) async {
    await (_db.update(_db.links)..where((tbl) => tbl.id.equals(id))).write(
      const LinksCompanion(isArchived: Value(true)),
    );
  }
}
