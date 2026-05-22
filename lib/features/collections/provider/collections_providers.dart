import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

part 'collections_providers.g.dart';

@Riverpod(keepAlive: true)
CollectionsRepository collectionsRepository(Ref ref) {
  return DriftCollectionsRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<List<CollectionWithCount>> collections(Ref ref) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(collectionsRepositoryProvider).watchCollections();
}

final collectionProvider = StreamProvider.family<Collection?, int>((
  ref,
  id,
) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(collectionsRepositoryProvider).watchCollection(id);
});

final collectionLinksProvider = StreamProvider.family<List<LinkWithTags>, int>((
  ref,
  collectionId,
) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref
      .watch(collectionsRepositoryProvider)
      .watchCollectionLinks(collectionId);
});

final availableCollectionLinksProvider =
    StreamProvider.family<List<LinkWithTags>, int>((ref, collectionId) async* {
      await ref.watch(seedDatabaseProvider.future);
      yield* ref
          .watch(collectionsRepositoryProvider)
          .watchAvailableLinks(collectionId);
    });

@riverpod
Stream<List<TagGroup>> collectionTags(Ref ref) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(collectionsRepositoryProvider).watchCollectionTags();
}

@riverpod
Stream<List<CollectionMetricPoint>> collectionsVelocityMetrics(Ref ref) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(collectionsRepositoryProvider).watchVelocityMetrics();
}

const allCollectionsFilter = 'ALL_COLLECTIONS';

@riverpod
class CollectionSelectionMode extends _$CollectionSelectionMode {
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
class SelectedCollectionIds extends _$SelectedCollectionIds {
  @override
  Set<int> build() => <int>{};

  void toggle(int collectionId) {
    if (state.contains(collectionId)) {
      final next = {...state}..remove(collectionId);
      state = next;
      return;
    }

    state = {...state, collectionId};
  }

  void clear() {
    state = <int>{};
  }

  void addAll(Iterable<int> collectionIds) {
    state = {...state, ...collectionIds};
  }

  void removeAll(Iterable<int> collectionIds) {
    final next = {...state};
    next.removeAll(collectionIds);
    state = next;
  }
}

@riverpod
class SelectedCollectionTag extends _$SelectedCollectionTag {
  @override
  String build() => allCollectionsFilter;

  void select(String filter) {
    state = filter;
  }
}

@riverpod
class CollectionSearchQuery extends _$CollectionSearchQuery {
  @override
  String build() => '';

  void update(String query) {
    state = query;
  }
}

@riverpod
AsyncValue<List<String>> collectionFilters(Ref ref) {
  final tags = ref.watch(collectionTagsProvider);

  return tags.whenData((items) {
    final values = <String>[
      allCollectionsFilter,
      ...items.map((tag) => tag.name),
    ];

    return values.toSet().toList(growable: false);
  });
}

@riverpod
AsyncValue<List<CollectionWithCount>> visibleCollections(Ref ref) {
  final collections = ref.watch(collectionsProvider);
  final selectedTag = ref.watch(selectedCollectionTagProvider);
  final query = ref.watch(collectionSearchQueryProvider).trim().toLowerCase();

  return collections.whenData((items) {
    return items
        .where((item) {
          final collection = item.collection;
          final matchesSearch =
              query.isEmpty ||
              collection.title.toLowerCase().contains(query) ||
              collection.type.toLowerCase().contains(query) ||
              collection.tagName.toLowerCase().contains(query) ||
              item.count.toString().contains(query);

          final matchesFilter =
              selectedTag == allCollectionsFilter ||
              collection.tagName == selectedTag;

          return matchesSearch && matchesFilter;
        })
        .toList(growable: false);
  });
}
