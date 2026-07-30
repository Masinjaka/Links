import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';

mixin DriftCollectionMutationWriter {
  AppDatabase get database;

  Future<int> create(
    String title,
    String type,
    String iconKey, {
    String? tagName,
  }) {
    return database
        .into(database.collections)
        .insert(
          CollectionsCompanion.insert(
            title: title.trim().toUpperCase(),
            type: type.trim().toUpperCase(),
            iconKey: Value(iconKey),
            tagName: Value(tagName?.trim().toUpperCase() ?? ''),
          ),
        );
  }

  Future<void> update(
    int id,
    String title,
    String type,
    String iconKey, {
    String? tagName,
  }) {
    return (database.update(
      database.collections,
    )..where((table) => table.id.equals(id))).write(
      CollectionsCompanion(
        title: Value(title.trim().toUpperCase()),
        type: Value(type.trim().toUpperCase()),
        iconKey: Value(iconKey),
        tagName: Value(tagName?.trim().toUpperCase() ?? ''),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> archive(Iterable<int> ids) {
    return _setArchived(ids, true);
  }

  Future<void> restore(Iterable<int> ids) {
    return _setArchived(ids, false);
  }

  Future<void> _setArchived(Iterable<int> ids, bool archived) {
    final values = ids.toSet().toList(growable: false);
    if (values.isEmpty) return Future.value();
    return (database.update(
      database.collections,
    )..where((table) => table.id.isIn(values))).write(
      CollectionsCompanion(
        isArchived: Value(archived),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> setFavourite(int id, bool value) {
    return (database.update(
      database.collections,
    )..where((table) => table.id.equals(id))).write(
      CollectionsCompanion(
        isFavourite: Value(value),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> setPinned(int id, bool value) {
    return (database.update(
      database.collections,
    )..where((table) => table.id.equals(id))).write(
      CollectionsCompanion(
        isPinned: Value(value),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> delete(int id) {
    return (database.delete(
      database.collections,
    )..where((table) => table.id.equals(id))).go();
  }

  Future<void> deletePermanently(Iterable<int> ids) {
    final values = ids.toSet().toList(growable: false);
    if (values.isEmpty) return Future.value();
    return (database.delete(
      database.collections,
    )..where((table) => table.id.isIn(values))).go();
  }

  Future<void> addLink(int collectionId, int linkId) async {
    await database
        .into(database.collectionLinks)
        .insert(
          CollectionLinksCompanion.insert(
            collectionId: collectionId,
            linkId: linkId,
          ),
          mode: InsertMode.insertOrIgnore,
        );
    await database.refreshSearchEntry(linkId);
  }

  Future<void> removeLink(int collectionId, int linkId) {
    return removeLinks(collectionId, [linkId]);
  }

  Future<void> removeLinks(int collectionId, Iterable<int> linkIds) async {
    final ids = linkIds.toSet();
    if (ids.isEmpty) return;
    await database.transaction(() async {
      await (database.delete(database.collectionLinks)
            ..where((table) => table.collectionId.equals(collectionId))
            ..where((table) => table.linkId.isIn(ids)))
          .go();
      for (final linkId in ids) {
        await database.refreshSearchEntry(linkId);
      }
    });
  }
}
