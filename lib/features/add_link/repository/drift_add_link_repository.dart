import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/domain/normalized_url.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/add_link/repository/add_link_repository.dart';
import 'package:linkvault/features/add_link/repository/link_metadata_writer.dart';
import 'package:linkvault/features/add_link/repository/link_relationship_writer.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/feed/repository/link_repository_utils.dart';

class DriftAddLinkRepository implements AddLinkRepository {
  DriftAddLinkRepository(this._db)
    : _relationships = LinkRelationshipWriter(_db),
      _metadata = LinkMetadataWriter(_db);

  final AppDatabase _db;
  final LinkRelationshipWriter _relationships;
  final LinkMetadataWriter _metadata;
  static const _normalizer = UrlNormalizer();

  @override
  Stream<List<Tag>> watchTags() {
    final query = _db.select(_db.tags)
      ..orderBy([(table) => OrderingTerm.asc(table.name)]);
    return query.watch();
  }

  @override
  Stream<LinkWithTags?> watchLink(int id) {
    final query = _db.select(_db.links)..where((table) => table.id.equals(id));
    return query.watchSingleOrNull().asyncMap(
      (link) => link == null ? null : hydrateLink(_db, link),
    );
  }

  @override
  Future<void> ensureTagExists(String name) async {
    if (name.trim().isNotEmpty) await _relationships.ensureTag(name);
  }

  @override
  Future<LinkWithTags?> findDuplicate(String rawUrl, {int? excludingId}) async {
    final identity = _normalizer.normalize(rawUrl);
    final query = _db.select(_db.links)
      ..where(
        (table) =>
            table.urlHash.equals(identity.hash) &
            table.normalizedUrl.equals(identity.normalized),
      );
    if (excludingId != null) {
      query.where((table) => table.id.equals(excludingId).not());
    }
    final link = await query.getSingleOrNull();
    return link == null ? null : hydrateLink(_db, link);
  }

  @override
  Future<int> create(
    LinkDraft draft, {
    AddLinkMetadata? metadata,
    bool allowDuplicate = false,
  }) async {
    final identity = _normalizer.normalize(draft.url);
    final duplicate = await findDuplicate(identity.original);
    if (duplicate != null && !allowDuplicate) {
      throw DuplicateBookmarkException(duplicate);
    }

    final now = DateTime.now();
    final status = draft.tags.isEmpty && draft.collectionIds.isEmpty
        ? 'inbox'
        : 'active';
    return _db.transaction(() async {
      final id = await _db
          .into(_db.links)
          .insert(
            LinksCompanion.insert(
              title: _newTitle(draft, metadata, identity.domain),
              url: _legacyUniqueUrl(identity.original, duplicate, now),
              originalUrl: Value(identity.original),
              normalizedUrl: Value(identity.normalized),
              canonicalUrl: Value(metadata?.url),
              urlHash: Value(identity.hash),
              domain: identity.domain,
              description: Value(
                draft.description ?? metadata?.description ?? '',
              ),
              note: Value(draft.note ?? ''),
              sourceImageUrl: Value(metadata?.imageUrl),
              faviconUrl: Value(metadata?.siteIconUrl),
              readingTime: Value(metadata?.readingTime ?? ''),
              status: Value(status),
              metadataStatus: Value(metadata == null ? 'pending' : 'completed'),
              metadataFetchedAt: Value(metadata == null ? null : now),
              createdAt: Value(now),
              updatedAt: Value(now),
            ),
          );
      await _metadata.write(id, metadata);
      await _relationships.merge(id, draft);
      if (metadata == null) await _metadata.queue(id, now);
      await _db.refreshSearchEntry(id);
      return id;
    });
  }

  @override
  Future<void> update(
    int id,
    LinkDraft draft, {
    AddLinkMetadata? metadata,
  }) async {
    final identity = _normalizer.normalize(draft.url);
    final existing = await (_db.select(
      _db.links,
    )..where((table) => table.id.equals(id))).getSingle();
    final nextStatus = switch (existing.status) {
      'archived' || 'trashed' => existing.status,
      _ =>
        draft.tags.isEmpty && draft.collectionIds.isEmpty ? 'inbox' : 'active',
    };
    await _db.transaction(() async {
      await (_db.update(
        _db.links,
      )..where((table) => table.id.equals(id))).write(
        LinksCompanion(
          title: Value(draft.title ?? metadata?.title ?? existing.title),
          originalUrl: Value(identity.original),
          normalizedUrl: Value(identity.normalized),
          urlHash: Value(identity.hash),
          domain: Value(identity.domain),
          description: Value(
            draft.description ?? metadata?.description ?? existing.description,
          ),
          note: Value(draft.note ?? existing.note),
          status: Value(nextStatus),
          updatedAt: Value(DateTime.now()),
        ),
      );
      await _metadata.write(id, metadata);
      await _relationships.replace(id, draft);
      await _db.refreshSearchEntry(id);
    });
  }

  @override
  Future<void> mergeInto(int id, LinkDraft draft) async {
    await _db.transaction(() async {
      await _relationships.merge(id, draft);
      await _touch(id);
      await _db.refreshSearchEntry(id);
    });
  }

  @override
  Future<void> replaceMetadata(int id, AddLinkMetadata metadata) async {
    await _db.transaction(() async {
      await _metadata.write(id, metadata);
      await _touch(id);
      await _db.refreshSearchEntry(id);
    });
  }

  String _newTitle(LinkDraft draft, AddLinkMetadata? metadata, String domain) {
    final supplied = draft.title?.trim();
    return supplied?.isNotEmpty == true ? supplied! : metadata?.title ?? domain;
  }

  String _legacyUniqueUrl(
    String original,
    LinkWithTags? duplicate,
    DateTime now,
  ) {
    return duplicate == null
        ? original
        : '$original#linkvault-copy-${now.microsecondsSinceEpoch}';
  }

  Future<void> _touch(int id) {
    return (_db.update(_db.links)..where((table) => table.id.equals(id))).write(
      LinksCompanion(updatedAt: Value(DateTime.now())),
    );
  }
}
