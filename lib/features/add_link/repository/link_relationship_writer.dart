import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

class LinkRelationshipWriter {
  const LinkRelationshipWriter(this._db);

  final AppDatabase _db;

  Future<void> replace(int linkId, LinkDraft draft) async {
    await (_db.delete(
      _db.linkTags,
    )..where((table) => table.linkId.equals(linkId))).go();
    await merge(linkId, draft);
  }

  Future<void> merge(int linkId, LinkDraft draft) async {
    for (final name
        in draft.tags.map(_normalizeTag).where((tag) => tag != '')) {
      final tagId = await ensureTag(name);
      await _db
          .into(_db.linkTags)
          .insert(
            LinkTagsCompanion.insert(linkId: linkId, tagId: tagId),
            mode: InsertMode.insertOrIgnore,
          );
    }
    for (final collectionId in draft.collectionIds) {
      await _db
          .into(_db.collectionLinks)
          .insert(
            CollectionLinksCompanion.insert(
              collectionId: collectionId,
              linkId: linkId,
            ),
            mode: InsertMode.insertOrIgnore,
          );
    }
  }

  Future<int> ensureTag(String name) async {
    final normalized = _normalizeTag(name);
    final existing = await (_db.select(
      _db.tags,
    )..where((table) => table.name.equals(normalized))).getSingleOrNull();
    if (existing != null) return existing.id;

    await _db
        .into(_db.tags)
        .insert(
          TagsCompanion.insert(name: normalized),
          mode: InsertMode.insertOrIgnore,
        );
    return (_db.select(_db.tags)
          ..where((table) => table.name.equals(normalized)))
        .getSingle()
        .then((tag) => tag.id);
  }

  String _normalizeTag(String value) => value.trim().toUpperCase();
}
