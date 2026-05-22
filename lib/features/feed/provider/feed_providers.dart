import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/feed/repository/feed_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

part 'feed_providers.g.dart';

const allAssetsFilter = 'ALL_ASSETS';

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
      'DESIGN',
      'DEV_LOGS',
      'ARCHIVE',
      ...items,
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
AsyncValue<List<LinkWithTags>> visibleFeedLinks(Ref ref) {
  final links = ref.watch(feedLinksProvider);
  final selectedFilter = ref.watch(selectedFeedFilterProvider);
  final query = ref.watch(feedSearchQueryProvider).trim().toLowerCase();

  return links.whenData((items) {
    return items
        .where((item) {
          final link = item.link;
          final matchesSearch =
              query.isEmpty ||
              link.title.toLowerCase().contains(query) ||
              link.url.toLowerCase().contains(query) ||
              link.domain.toLowerCase().contains(query) ||
              item.tags.any((tag) => tag.name.toLowerCase().contains(query));

          final matchesFilter = switch (selectedFilter) {
            allAssetsFilter => true,
            'DEV_LOGS' => item.tags.any((tag) => tag.name == 'DEV'),
            'ARCHIVE' => link.isArchived,
            _ => item.tags.any((tag) => tag.name == selectedFilter),
          };

          return matchesSearch && matchesFilter;
        })
        .toList(growable: false);
  });
}
