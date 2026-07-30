import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/presentation/show_collection_details_sheet.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_details_widgets.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_sort_button.dart';
import 'package:linkvault/features/collections/presentation/widget/collections_empty_state.dart';
import 'package:linkvault/features/collections/presentation/widget/collections_widgets.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_filter_rail.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_search_strip.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/pinned_search_filter_app_bar.dart';
import 'package:linkvault/shared/presentation/widgets/select_all_strip.dart';
import 'package:linkvault/shared/presentation/widgets/library_circle_button.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_sliver_page.dart';

class CollectionsPage extends ConsumerWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(visibleCollectionsProvider);
    final visibleItems = collections.value ?? const <CollectionWithCount>[];
    final filters =
        ref.watch(collectionFiltersProvider).value ??
        const [allCollectionsFilter];
    final selectedFilter = ref.watch(selectedCollectionTagProvider);
    final selectedSort = ref.watch(selectedCollectionSortProvider);
    final searchQuery = ref.watch(collectionSearchQueryProvider);
    final selectionMode = ref.watch(collectionSelectionModeProvider);
    final selectedIds = ref.watch(selectedCollectionIdsProvider);
    final visibleIds = visibleItems
        .map((item) => item.collection.id)
        .toList(growable: false);
    final allVisibleSelected =
        visibleIds.isNotEmpty &&
        visibleIds.every((id) => selectedIds.contains(id));
    final overlay = selectionMode
        ? CollectionArchiveAction(
            onPressed: () => _archiveSelectedCollections(context, ref),
          )
        : null;

    return VelocitySliverPage(
      overlay: overlay,
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(36, 32, 36, 0),
          sliver: SliverToBoxAdapter(child: CollectionsHeader()),
        ),
        PinnedSearchFilterAppBar(
          search: selectionMode
              ? SelectAllStrip(
                  selected: allVisibleSelected,
                  onTap: () => _toggleVisibleSelections(
                    ref,
                    visibleIds,
                    allVisibleSelected,
                  ),
                  onCancel: () => _exitSelectionMode(ref),
                )
              : FeedSearchStrip(
                  onChanged: (value) {
                    ref
                        .read(collectionSearchQueryProvider.notifier)
                        .update(value);
                  },
                ),
          action: selectionMode
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CollectionSortButton(
                      selected: selectedSort,
                      onSelected: (value) {
                        ref
                            .read(selectedCollectionSortProvider.notifier)
                            .select(value);
                      },
                    ),
                    const SizedBox(width: 8),
                    _selectionButton(context, ref),
                  ],
                ),
          filters: FeedFilterRail(
            filters: filters,
            selectedFilter: selectedFilter,
            onSelected: (filter) {
              ref.read(selectedCollectionTagProvider.notifier).select(filter);
            },
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(36, 28, 36, selectionMode ? 80 : 152),
          sliver: SliverToBoxAdapter(
            child: collections.when(
              data: (items) => items.isEmpty
                  ? const CollectionsEmptyState()
                  : CollectionsGrid(
                      key: ValueKey(
                        'collections-grid-$selectedFilter-$searchQuery-'
                        '$selectionMode-'
                        '${items.map((item) => item.collection.id).join('-')}',
                      ),
                      items: items,
                      selectionMode: selectionMode,
                      selectedIds: selectedIds,
                      onOpen: (item) {
                        showCollectionDetailsSheet(
                          context: context,
                          collectionId: item.collection.id,
                        );
                      },
                      onToggleSelection: (item) {
                        ref
                            .read(collectionSelectionModeProvider.notifier)
                            .enable();
                        ref
                            .read(selectedCollectionIdsProvider.notifier)
                            .toggle(item.collection.id);
                      },
                    ),
              error: (_, _) => Text(
                linkVaultLocalizationsOf(context).databaseError,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: LinkVaultColors.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _selectionButton(BuildContext context, WidgetRef ref) {
    return LibraryCircleButton(
      onPressed: () {
        ref.read(collectionSelectionModeProvider.notifier).enable();
      },
      tooltip: linkVaultLocalizationsOf(context).selectMultiple,
      icon: Icons.checklist_rounded,
    );
  }

  static void _exitSelectionMode(WidgetRef ref) {
    ref.read(collectionSelectionModeProvider.notifier).disable();
    ref.read(selectedCollectionIdsProvider.notifier).clear();
  }

  static Future<void> _archiveSelectedCollections(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final selectedIds = ref.read(selectedCollectionIdsProvider);
    if (selectedIds.isEmpty) return;
    final confirmed = await showArchiveCollectionsDialog(
      context,
      selectedIds.length,
    );
    if (!confirmed) return;

    final repository = ref.read(collectionsRepositoryProvider);
    await repository.archive(selectedIds);
    ref.read(selectedCollectionIdsProvider.notifier).clear();
  }

  static void _toggleVisibleSelections(
    WidgetRef ref,
    List<int> visibleIds,
    bool allVisibleSelected,
  ) {
    if (visibleIds.isEmpty) return;
    final notifier = ref.read(selectedCollectionIdsProvider.notifier);
    allVisibleSelected
        ? notifier.removeAll(visibleIds)
        : notifier.addAll(visibleIds);
  }
}
