import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';

class BookmarkLifecycleWriter {
  const BookmarkLifecycleWriter(this._db);

  final AppDatabase _db;

  Future<void> archive(Iterable<int> ids) {
    return _setStatus(ids, 'archived');
  }

  Future<void> trash(Iterable<int> ids) {
    return _setStatus(ids, 'trashed');
  }

  Future<void> restore(Iterable<int> ids) async {
    final values = ids.toSet();
    await _db.transaction(() async {
      for (final id in values) {
        final organised = await _isOrganised(id);
        await (_db.update(
          _db.links,
        )..where((table) => table.id.equals(id))).write(
          LinksCompanion(
            status: Value(organised ? 'active' : 'inbox'),
            isArchived: const Value(false),
            archivedAt: const Value(null),
            deletedAt: const Value(null),
            updatedAt: Value(DateTime.now()),
          ),
        );
      }
    });
  }

  Future<void> setFavourite(Iterable<int> ids, bool value) {
    return _setFlag(ids, LinksCompanion(isFavourite: Value(value)));
  }

  Future<void> setPinned(Iterable<int> ids, bool value) {
    return _setFlag(ids, LinksCompanion(isPinned: Value(value)));
  }

  Future<void> updateNote(int id, String note) async {
    final existing = await (_db.select(
      _db.links,
    )..where((table) => table.id.equals(id))).getSingle();
    final now = DateTime.now();
    final updatedAt = now.difference(existing.updatedAt).inSeconds > 0
        ? now
        : existing.updatedAt.add(const Duration(seconds: 1));
    await (_db.update(_db.links)..where((table) => table.id.equals(id))).write(
      LinksCompanion(note: Value(note.trim()), updatedAt: Value(updatedAt)),
    );
    await _db.refreshSearchEntry(id);
  }

  Future<void> markOpened(int id) {
    return (_db.update(_db.links)..where((table) => table.id.equals(id))).write(
      LinksCompanion(
        lastOpenedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deletePermanently(Iterable<int> ids) async {
    final values = ids.toSet().toList(growable: false);
    if (values.isEmpty) return;
    final deletableRows =
        await (_db.select(_db.links)..where(
              (table) =>
                  table.id.isIn(values) &
                  table.status.isIn(['trashed', 'archived']),
            ))
            .get();
    final deletable = deletableRows
        .map((link) => link.id)
        .toList(growable: false);
    if (deletable.isEmpty) return;
    await _db.transaction(() async {
      await (_db.delete(
        _db.linkTags,
      )..where((table) => table.linkId.isIn(deletable))).go();
      await (_db.delete(
        _db.collectionLinks,
      )..where((table) => table.linkId.isIn(deletable))).go();
      await (_db.delete(
        _db.pendingTasks,
      )..where((table) => table.bookmarkId.isIn(deletable))).go();
      await (_db.delete(
        _db.bookmarkSnapshots,
      )..where((table) => table.bookmarkId.isIn(deletable))).go();
      await (_db.delete(
        _db.linkPreviews,
      )..where((table) => table.linkId.isIn(deletable))).go();
      await (_db.delete(
        _db.links,
      )..where((table) => table.id.isIn(deletable))).go();
      for (final id in deletable) {
        await _db.customStatement(
          'DELETE FROM link_search WHERE bookmark_id = ?',
          [id],
        );
      }
    });
  }

  Future<void> emptyTrash() async {
    final ids = await (_db.select(
      _db.links,
    )..where((table) => table.status.equals('trashed'))).get();
    await deletePermanently(ids.map((link) => link.id));
  }

  Future<void> _setStatus(Iterable<int> ids, String status) async {
    final values = ids.toSet().toList(growable: false);
    if (values.isEmpty) return;
    final now = DateTime.now();
    await (_db.update(
      _db.links,
    )..where((table) => table.id.isIn(values))).write(
      LinksCompanion(
        status: Value(status),
        isArchived: Value(status == 'archived'),
        archivedAt: Value(status == 'archived' ? now : null),
        deletedAt: Value(status == 'trashed' ? now : null),
        updatedAt: Value(now),
      ),
    );
  }

  Future<void> _setFlag(Iterable<int> ids, LinksCompanion fields) async {
    final values = ids.toSet().toList(growable: false);
    if (values.isEmpty) return;
    await (_db.update(_db.links)..where((table) => table.id.isIn(values)))
        .write(fields.copyWith(updatedAt: Value(DateTime.now())));
  }

  Future<bool> _isOrganised(int id) async {
    final tag = await (_db.select(
      _db.linkTags,
    )..where((table) => table.linkId.equals(id))).getSingleOrNull();
    if (tag != null) return true;
    final collection = await (_db.select(
      _db.collectionLinks,
    )..where((table) => table.linkId.equals(id))).getSingleOrNull();
    return collection != null;
  }
}
