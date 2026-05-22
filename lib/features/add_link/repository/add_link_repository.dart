import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/feed/repository/link_repository_utils.dart';

abstract interface class AddLinkRepository {
  Future<int> create(LinkDraft draft, {AddLinkMetadata? metadata});
  Future<void> update(int id, LinkDraft draft, {AddLinkMetadata? metadata});
  Stream<List<Tag>> watchTags();
  Stream<LinkWithTags?> watchLink(int id);
  Future<void> ensureTagExists(String name);
}

class DriftAddLinkRepository implements AddLinkRepository {
  const DriftAddLinkRepository(this._db, this._metadataRepository);

  final AppDatabase _db;
  final AddLinkMetadataRepository _metadataRepository;

  @override
  Stream<List<Tag>> watchTags() {
    final query = _db.select(_db.tags)
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]);

    return query.watch();
  }

  @override
  Stream<LinkWithTags?> watchLink(int id) {
    final query = _db.select(_db.links)..where((tbl) => tbl.id.equals(id));
    return query.watchSingleOrNull().asyncMap((link) async {
      if (link == null) {
        return null;
      }

      return hydrateLink(_db, link);
    });
  }

  @override
  Future<void> ensureTagExists(String name) async {
    final normalized = name.trim().toUpperCase();
    if (normalized.isEmpty) {
      return;
    }

    await _findOrCreateTagId(normalized);
  }

  @override
  Future<int> create(LinkDraft draft, {AddLinkMetadata? metadata}) async {
    final url = normalizeUrl(draft.url);
    final parsedUrl = Uri.tryParse(url);
    final preview = metadata ?? await _metadataRepository.fetch(url);
    final now = DateTime.now();

    return _db.transaction(() async {
      final linkId = await _db
          .into(_db.links)
          .insert(
            LinksCompanion.insert(
              title: draft.title?.trim().isNotEmpty == true
                  ? draft.title!.trim()
                  : preview.title,
              url: url,
              domain: parsedUrl?.host ?? 'local',
              description: Value(draft.description ?? preview.description),
              sourceImageUrl: Value(preview.imageUrl),
              readingTime: Value(preview.readingTime ?? ''),
              createdAt: Value(now),
              updatedAt: Value(now),
            ),
            mode: InsertMode.insertOrReplace,
          );

      await _db
          .into(_db.linkPreviews)
          .insert(
            LinkPreviewsCompanion.insert(
              linkId: linkId,
              previewTitle: preview.title,
              previewDescription: Value(preview.description),
              imageUrl: Value(preview.imageUrl),
            ),
            mode: InsertMode.insertOrReplace,
          );

      await (_db.delete(
        _db.linkTags,
      )..where((tbl) => tbl.linkId.equals(linkId))).go();
      for (final name
          in draft.tags
              .map((tag) => tag.trim().toUpperCase())
              .where((tag) => tag.isNotEmpty)) {
        final tagId = await _findOrCreateTagId(name);
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

      return linkId;
    });
  }

  @override
  Future<void> update(
    int id,
    LinkDraft draft, {
    AddLinkMetadata? metadata,
  }) async {
    final url = normalizeUrl(draft.url);
    final parsedUrl = Uri.tryParse(url);
    final preview = metadata ?? await _metadataRepository.fetch(url);
    final existing = await (_db.select(
      _db.links,
    )..where((tbl) => tbl.id.equals(id))).getSingle();

    await _db.transaction(() async {
      await (_db.update(_db.links)..where((tbl) => tbl.id.equals(id))).write(
        LinksCompanion(
          title: Value(
            draft.title?.trim().isNotEmpty == true
                ? draft.title!.trim()
                : preview.title,
          ),
          url: Value(url),
          domain: Value(parsedUrl?.host ?? existing.domain),
          description: Value(draft.description ?? preview.description),
          sourceImageUrl: Value(preview.imageUrl),
          readingTime: Value(preview.readingTime ?? existing.readingTime),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await _db
          .into(_db.linkPreviews)
          .insert(
            LinkPreviewsCompanion.insert(
              linkId: id,
              previewTitle: preview.title,
              previewDescription: Value(preview.description),
              imageUrl: Value(preview.imageUrl),
            ),
            mode: InsertMode.insertOrReplace,
          );

      await (_db.delete(
        _db.linkTags,
      )..where((tbl) => tbl.linkId.equals(id))).go();
      for (final name
          in draft.tags
              .map((tag) => tag.trim().toUpperCase())
              .where((tag) => tag.isNotEmpty)) {
        final tagId = await _findOrCreateTagId(name);
        await _db
            .into(_db.linkTags)
            .insert(
              LinkTagsCompanion.insert(linkId: id, tagId: tagId),
              mode: InsertMode.insertOrIgnore,
            );
      }

      if (draft.collectionIds.isNotEmpty) {
        await (_db.delete(
          _db.collectionLinks,
        )..where((tbl) => tbl.linkId.equals(id))).go();
        for (final collectionId in draft.collectionIds) {
          await _db
              .into(_db.collectionLinks)
              .insert(
                CollectionLinksCompanion.insert(
                  collectionId: collectionId,
                  linkId: id,
                ),
                mode: InsertMode.insertOrIgnore,
              );
        }
      }
    });
  }

  Future<int> _findOrCreateTagId(String name) async {
    final existing = await (_db.select(
      _db.tags,
    )..where((tbl) => tbl.name.equals(name))).getSingleOrNull();
    if (existing != null) {
      return existing.id;
    }

    await _db
        .into(_db.tags)
        .insert(
          TagsCompanion.insert(name: name),
          mode: InsertMode.insertOrIgnore,
        );

    final inserted = await (_db.select(
      _db.tags,
    )..where((tbl) => tbl.name.equals(name))).getSingle();

    return inserted.id;
  }
}
