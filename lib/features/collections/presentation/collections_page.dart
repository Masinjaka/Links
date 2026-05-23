import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_details_widgets.dart';
import 'package:linkvault/features/collections/presentation/widget/collections_widgets.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_filter_rail.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_search_strip.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/shared/presentation/widgets/square_button_widget.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';

class CollectionsPage extends ConsumerWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(visibleCollectionsProvider);
    final List<CollectionWithCount> visibleItems = collections.maybeWhen(
      data: (items) => items,
      orElse: () => const <CollectionWithCount>[],
    );
    final filters =
        ref.watch(collectionFiltersProvider).value ??
        const [allCollectionsFilter];
    final selectedFilter = ref.watch(selectedCollectionTagProvider);
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
        ? (selectedIds.isEmpty
              ? null
              : CollectionArchiveAction(
                  onPressed: () => _archiveSelectedCollections(context, ref),
                ))
        : CollectionQuickAction(
            onPressed: () => context.go('/collections/add'),
          );

    return VelocityPage(
      bottomInset: 120,
      spacing: 0,
      overlay: overlay,
      children: [
        const CollectionsHeader(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: selectionMode
                      ? _SelectAllStrip(
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
                ),
                if (!selectionMode) ...[
                  const SizedBox(width: 16),
                  SquareButton(
                    onPressed: () {
                      ref
                          .read(collectionSelectionModeProvider.notifier)
                          .enable();
                    },
                    tooltip: 'SELECT_MULTIPLE',
                    icon: Icons.checklist_sharp,
                    size: 52,
                    backgroundColor: LinkVaultThemeTokens.surface(context),
                    iconColor: LinkVaultColors.primary,
                    shadowed: false,
                    borderColor: LinkVaultColors.ink,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 32),
            FeedFilterRail(
              filters: filters,
              selectedFilter: selectedFilter,
              onSelected: (filter) {
                ref.read(selectedCollectionTagProvider.notifier).select(filter);
              },
            ),
            const SizedBox(height: 32),
            collections.when(
              data: (items) => CollectionsGrid(
                key: ValueKey(
                  'collections-grid-$selectedFilter-$searchQuery-$selectionMode-${items.map((item) => item.collection.id).join('-')}',
                ),
                items: items,
                selectionMode: selectionMode,
                selectedIds: selectedIds,
                onOpen: (item) {
                  context.go('/collections/view?id=${item.collection.id}');
                },
                onToggleSelection: (item) {
                  ref
                      .read(selectedCollectionIdsProvider.notifier)
                      .toggle(item.collection.id);
                },
              ),
              error: (error, stackTrace) => Text(
                'DATABASE_ERROR'.displayText,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: LinkVaultColors.primary,
                ),
              ),
            ),
          ],
        ),
      ],
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
    if (selectedIds.isEmpty) {
      return;
    }

    final confirmed = await showArchiveCollectionsDialog(
      context,
      selectedIds.length,
    );
    if (!confirmed) {
      return;
    }

    final repository = ref.read(collectionsRepositoryProvider);
    for (final collectionId in selectedIds) {
      await repository.delete(collectionId);
    }

    _exitSelectionMode(ref);
  }

  static void _toggleVisibleSelections(
    WidgetRef ref,
    List<int> visibleIds,
    bool allVisibleSelected,
  ) {
    if (visibleIds.isEmpty) {
      return;
    }

    final notifier = ref.read(selectedCollectionIdsProvider.notifier);
    if (allVisibleSelected) {
      notifier.removeAll(visibleIds);
      return;
    }

    notifier.addAll(visibleIds);
  }
}

class _SelectAllStrip extends StatelessWidget {
  const _SelectAllStrip({
    required this.selected,
    required this.onTap,
    required this.onCancel,
  });

  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ink = LinkVaultThemeTokens.ink(context);

    return Material(
      color: Colors.transparent,
      borderRadius: LinkVaultThemeTokens.componentRadius,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: LinkVaultThemeTokens.surface(context),
          // border: Border.all(color: ink),
          borderRadius: LinkVaultThemeTokens.componentRadius,
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onTap,
                borderRadius: LinkVaultThemeTokens.componentRadius,
                child: Row(
                  children: [
                    _SelectAllCheckbox(selected: selected),
                    const SizedBox(width: 14),
                    Text(
                      'SELECT_ALL'.displayText,
                      style: textTheme.bodyLarge?.copyWith(
                        color: ink,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: onCancel,
              style: TextButton.styleFrom(
                foregroundColor: LinkVaultColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text('CANCEL'.displayText),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectAllCheckbox extends StatelessWidget {
  const _SelectAllCheckbox({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final ink = LinkVaultThemeTokens.ink(context);
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: selected
            ? LinkVaultColors.primary
            : LinkVaultThemeTokens.surface(context),
        border: Border.all(
          color: selected ? LinkVaultColors.primary : ink,
          width: 2,
        ),
      ),
      child: selected
          ? Icon(
              Icons.check_rounded,
              size: 16,
              color: LinkVaultColors.onPrimary,
            )
          : null,
    );
  }
}
