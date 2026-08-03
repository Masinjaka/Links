import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/domain/feed_query.dart';
import 'package:linkvault/features/feed/repository/feed_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

final class RecordingFeedRepository implements FeedRepository {
  bool? favouriteValue;
  bool? pinnedValue;
  Set<int> favouriteIds = {};
  Set<int> pinnedIds = {};
  Set<int> trashedIds = {};
  Set<int> restoredIds = {};
  Set<int> deletedIds = {};

  @override
  Future<void> setFavourite(Iterable<int> linkIds, bool value) async {
    favouriteIds = linkIds.toSet();
    favouriteValue = value;
  }

  @override
  Future<void> setPinned(Iterable<int> linkIds, bool value) async {
    pinnedIds = linkIds.toSet();
    pinnedValue = value;
  }

  @override
  Stream<List<LinkWithTags>> watchLinks([
    FeedQuery query = const FeedQuery(),
  ]) => const Stream.empty();

  @override
  Stream<List<Tag>> watchTags() => const Stream.empty();

  @override
  Stream<List<Collection>> watchCollections() => const Stream.empty();

  @override
  Stream<List<String>> watchContentTypes() => const Stream.empty();

  @override
  Stream<List<String>> watchDomains() => const Stream.empty();

  @override
  Future<void> archiveLinks(Iterable<int> linkIds) async {}

  @override
  Future<void> deletePermanently(Iterable<int> linkIds) async {
    deletedIds = linkIds.toSet();
  }

  @override
  Future<void> emptyTrash() async {}

  @override
  Future<void> markOpened(int linkId) async {}

  @override
  Future<void> restoreLinks(Iterable<int> linkIds) async {
    restoredIds = linkIds.toSet();
  }

  @override
  Future<void> trashLinks(Iterable<int> linkIds) async {
    trashedIds = linkIds.toSet();
  }

  @override
  Future<void> updateNote(int linkId, String note) async {}
}
