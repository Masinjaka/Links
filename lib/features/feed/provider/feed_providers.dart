import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/feed/domain/bookmark_state.dart';
import 'package:linkvault/features/feed/domain/feed_query.dart';
import 'package:linkvault/features/feed/provider/feed_filter_providers.dart';
import 'package:linkvault/features/feed/repository/feed_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

part 'feed_providers.g.dart';

const allAssetsFilter = 'ALL_ASSETS';
const inboxFilter = 'INBOX';
const favouritesFilter = 'FAVOURITES';
const archiveFilter = 'ARCHIVE';
const trashFilter = 'TRASH';

@riverpod
class FeedSelectionMode extends _$FeedSelectionMode {
  @override
  bool build() => false;

  void enable() {
    state = true;
  }

  void disable() {
    state = false;
  }
}

@riverpod
class SelectedFeedLinkIds extends _$SelectedFeedLinkIds {
  @override
  Set<int> build() => <int>{};

  void toggle(int linkId) {
    if (state.contains(linkId)) {
      final next = {...state}..remove(linkId);
      state = next;
      return;
    }

    state = {...state, linkId};
  }

  void clear() {
    state = <int>{};
  }

  void addAll(Iterable<int> linkIds) {
    state = {...state, ...linkIds};
  }

  void removeAll(Iterable<int> linkIds) {
    final next = {...state};
    next.removeAll(linkIds);
    state = next;
  }
}

@Riverpod(keepAlive: true)
FeedRepository feedRepository(Ref ref) {
  return DriftFeedRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<List<LinkWithTags>> feedLinks(Ref ref) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(feedRepositoryProvider).watchLinks();
}

@riverpod
AsyncValue<List<String>> feedFilters(Ref ref) {
  final tags = ref.watch(addLinkAvailableTagsProvider);

  return tags.whenData((items) {
    final values = <String>[
      allAssetsFilter,
      inboxFilter,
      favouritesFilter,
      trashFilter,
      ...items.where((tag) => !_isArchiveLabel(tag)),
    ];

    return values.toSet().toList(growable: false);
  });
}

@riverpod
class SelectedFeedFilter extends _$SelectedFeedFilter {
  @override
  String build() => allAssetsFilter;

  void select(String filter) {
    state = filter;
  }
}

@riverpod
class FeedSearchQuery extends _$FeedSearchQuery {
  @override
  String build() => '';

  void update(String query) {
    state = query;
  }
}

@riverpod
class SelectedFeedSort extends _$SelectedFeedSort {
  @override
  FeedSort build() => FeedSort.recentlyAdded;

  void select(FeedSort value) => state = value;
}

@riverpod
Stream<List<LinkWithTags>> visibleFeedLinks(Ref ref) async* {
  await ref.watch(seedDatabaseProvider.future);
  final selectedFilter = ref.watch(selectedFeedFilterProvider);
  final text = ref.watch(feedSearchQueryProvider);
  final sort = ref.watch(selectedFeedSortProvider);
  final advanced = ref.watch(advancedFeedFilterStateProvider);
  final scope = switch (selectedFilter) {
    inboxFilter => BookmarkScope.inbox,
    archiveFilter => BookmarkScope.archived,
    trashFilter => BookmarkScope.trashed,
    _ => BookmarkScope.library,
  };
  final query = FeedQuery(
    text: text,
    scope: scope,
    favourite: selectedFilter == favouritesFilter ? true : null,
    tag: _systemFilters.contains(selectedFilter) ? null : selectedFilter,
    collectionId: advanced.collectionId,
    domain: advanced.domain,
    contentType: advanced.contentType,
    availableOffline: advanced.availableOffline,
    broken: advanced.broken,
    addedFrom: advanced.addedFrom,
    addedTo: advanced.addedTo,
    sort: sort,
  );
  yield* ref.watch(feedRepositoryProvider).watchLinks(query);
}

const _systemFilters = {
  allAssetsFilter,
  inboxFilter,
  favouritesFilter,
  archiveFilter,
  trashFilter,
};

bool _isArchiveLabel(String value) {
  final normalized = value.trim().toUpperCase();
  return normalized == archiveFilter || normalized == 'ARCHIVED';
}
