import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/collections/presentation/show_collection_details_sheet.dart';
import 'package:linkvault/features/collections/presentation/widget/collections_widgets.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/shared/presentation/widgets/library_empty_state.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class ArchivedCollectionsList extends StatelessWidget {
  const ArchivedCollectionsList({
    super.key,
    required this.collections,
    required this.query,
    required this.selectedTag,
    required this.sort,
    required this.selectionMode,
    required this.selectedIds,
    required this.onToggleSelection,
  });

  final AsyncValue<List<CollectionWithCount>> collections;
  final String query;
  final String selectedTag;
  final CollectionSort sort;
  final bool selectionMode;
  final Set<int> selectedIds;
  final ValueChanged<int> onToggleSelection;

  @override
  Widget build(BuildContext context) {
    return collections.when(
      data: (items) {
        final visible = visibleArchivedCollections(
          items,
          query: query,
          selectedTag: selectedTag,
          sort: sort,
        );
        if (visible.isEmpty) {
          return LibraryEmptyState(
            title: linkVaultLocalizationsOf(context).noArchivedCollections,
          );
        }
        return ListView.separated(
          key: const Key('archived-collections-list'),
          padding: const EdgeInsets.fromLTRB(32, 28, 32, 40),
          itemCount: visible.length,
          separatorBuilder: (_, _) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = visible[index];
            final id = item.collection.id;
            return CollectionFeedCard(
                  key: ValueKey('archived-collection-$id-$selectionMode'),
                  group: item,
                  selectionMode: selectionMode,
                  selected: selectedIds.contains(id),
                  onToggleSelection: () => onToggleSelection(id),
                  onOpen: () => showCollectionDetailsSheet(
                    context: context,
                    collectionId: id,
                  ),
                )
                .animate(delay: (60 * index).ms)
                .fadeIn(duration: 240.ms)
                .slideY(begin: .05, end: 0, curve: Curves.easeOutCubic);
          },
        );
      },
      error: (_, _) =>
          Center(child: Text(linkVaultLocalizationsOf(context).databaseError)),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

List<CollectionWithCount> visibleArchivedCollections(
  List<CollectionWithCount> items, {
  required String query,
  required String selectedTag,
  required CollectionSort sort,
}) {
  final normalizedQuery = query.trim().toLowerCase();
  final visible = items.where((item) {
    final collection = item.collection;
    final matchesQuery =
        normalizedQuery.isEmpty ||
        collection.title.toLowerCase().contains(normalizedQuery) ||
        collection.tagName.toLowerCase().contains(normalizedQuery);
    final matchesTag =
        selectedTag == allCollectionsFilter ||
        collection.tagName == selectedTag;
    return matchesQuery && matchesTag;
  }).toList();
  visible.sort((left, right) {
    return switch (sort) {
      CollectionSort.recentlyCreated => right.collection.createdAt.compareTo(
        left.collection.createdAt,
      ),
      CollectionSort.alphabetical => left.collection.title.compareTo(
        right.collection.title,
      ),
      CollectionSort.linkCount => right.count.compareTo(left.count),
    };
  });
  return visible;
}
