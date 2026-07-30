import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/domain/feed_query.dart';
import 'package:linkvault/features/feed/repository/feed_query_builder.dart';
import 'package:linkvault/features/feed/repository/bookmark_lifecycle_writer.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/feed/repository/link_repository_utils.dart';

abstract interface class FeedRepository {
  Stream<List<LinkWithTags>> watchLinks([FeedQuery query = const FeedQuery()]);
  Stream<List<Tag>> watchTags();
  Stream<List<String>> watchDomains();
  Stream<List<String>> watchContentTypes();
  Stream<List<Collection>> watchCollections();
  Future<void> archiveLinks(Iterable<int> linkIds);
  Future<void> trashLinks(Iterable<int> linkIds);
  Future<void> restoreLinks(Iterable<int> linkIds);
  Future<void> setFavourite(Iterable<int> linkIds, bool value);
  Future<void> setPinned(Iterable<int> linkIds, bool value);
  Future<void> updateNote(int linkId, String note);
  Future<void> markOpened(int linkId);
  Future<void> deletePermanently(Iterable<int> linkIds);
  Future<void> emptyTrash();
}

class DriftFeedRepository implements FeedRepository {
  DriftFeedRepository(this._db) : _lifecycle = BookmarkLifecycleWriter(_db);

  final AppDatabase _db;
  final BookmarkLifecycleWriter _lifecycle;
  static const _queryBuilder = FeedQueryBuilder();

  @override
  Stream<List<LinkWithTags>> watchLinks([FeedQuery query = const FeedQuery()]) {
    final statement = _queryBuilder.build(query);
    return _db
        .customSelect(
          statement.sql,
          variables: statement.variables,
          readsFrom: {
            _db.links,
            _db.linkTags,
            _db.tags,
            _db.collectionLinks,
            _db.collections,
            _db.bookmarkSnapshots,
          },
        )
        .watch()
        .asyncMap((rows) async {
          return Future.wait(
            rows.map((row) async {
              final id = row.read<int>('id');
              final link = await (_db.select(
                _db.links,
              )..where((table) => table.id.equals(id))).getSingle();
              return hydrateLink(_db, link);
            }),
          );
        });
  }

  @override
  Stream<List<Tag>> watchTags() {
    final query = _db.select(_db.tags)
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]);

    return query.watch();
  }

  @override
  Stream<List<String>> watchDomains() {
    final query = _db.selectOnly(_db.links, distinct: true)
      ..addColumns([_db.links.domain])
      ..orderBy([OrderingTerm.asc(_db.links.domain)]);
    return query.watch().map(
      (rows) => rows
          .map((row) => row.read(_db.links.domain))
          .whereType<String>()
          .toList(growable: false),
    );
  }

  @override
  Stream<List<String>> watchContentTypes() {
    final query = _db.selectOnly(_db.links, distinct: true)
      ..addColumns([_db.links.contentType])
      ..orderBy([OrderingTerm.asc(_db.links.contentType)]);
    return query.watch().map(
      (rows) => rows
          .map((row) => row.read(_db.links.contentType))
          .whereType<String>()
          .toList(growable: false),
    );
  }

  @override
  Stream<List<Collection>> watchCollections() {
    final query = _db.select(_db.collections)
      ..where((table) => table.isArchived.equals(false))
      ..orderBy([(table) => OrderingTerm.asc(table.title)]);
    return query.watch();
  }

  @override
  Future<void> archiveLinks(Iterable<int> linkIds) async {
    await _lifecycle.archive(linkIds);
  }

  @override
  Future<void> trashLinks(Iterable<int> linkIds) => _lifecycle.trash(linkIds);

  @override
  Future<void> restoreLinks(Iterable<int> linkIds) =>
      _lifecycle.restore(linkIds);

  @override
  Future<void> setFavourite(Iterable<int> ids, bool value) =>
      _lifecycle.setFavourite(ids, value);

  @override
  Future<void> setPinned(Iterable<int> ids, bool value) =>
      _lifecycle.setPinned(ids, value);

  @override
  Future<void> updateNote(int id, String note) =>
      _lifecycle.updateNote(id, note);

  @override
  Future<void> markOpened(int id) => _lifecycle.markOpened(id);

  @override
  Future<void> deletePermanently(Iterable<int> ids) =>
      _lifecycle.deletePermanently(ids);

  @override
  Future<void> emptyTrash() => _lifecycle.emptyTrash();
}
