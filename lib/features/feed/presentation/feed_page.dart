import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/link_details/presentation/show_link_details_sheet.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_filter_rail.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_header_widget.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_links_sliver.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_search_strip.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_sort_button.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_selection_overlay.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/pinned_search_filter_app_bar.dart';
import 'package:linkvault/shared/presentation/widgets/select_all_strip.dart';
import 'package:linkvault/shared/presentation/widgets/library_circle_button.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_sliver_page.dart';

class FeedPage extends ConsumerWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final links = ref.watch(visibleFeedLinksProvider);
    final visibleLinks = links.value ?? const <LinkWithTags>[];
    final filters =
        ref.watch(feedFiltersProvider).value ?? const [allAssetsFilter];
    final selectedFilter = ref.watch(selectedFeedFilterProvider);
    final searchQuery = ref.watch(feedSearchQueryProvider);
    final selectedSort = ref.watch(selectedFeedSortProvider);
    final selectionMode = ref.watch(feedSelectionModeProvider);
    final selectedIds = ref.watch(selectedFeedLinkIdsProvider);
    final visibleIds = visibleLinks
        .map((item) => item.link.id)
        .toList(growable: false);
    final allVisibleSelected =
        visibleIds.isNotEmpty &&
        visibleIds.every((id) => selectedIds.contains(id));
    final selectedLinks = visibleLinks
        .where((item) => selectedIds.contains(item.link.id))
        .toList(growable: false);
    final allSelectedFavourite =
        selectedLinks.isNotEmpty &&
        selectedLinks.length == selectedIds.length &&
        selectedLinks.every((item) => item.link.isFavourite);
    final allSelectedPinned =
        selectedLinks.isNotEmpty &&
        selectedLinks.length == selectedIds.length &&
        selectedLinks.every((item) => item.link.isPinned);
    final overlay = selectionMode
        ? FeedSelectionOverlay(
            selectedFilter: selectedFilter,
            allFavourite: allSelectedFavourite,
            allPinned: allSelectedPinned,
          )
        : null;

    return VelocitySliverPage(
      overlay: overlay,
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(36, 32, 36, 0),
          sliver: SliverToBoxAdapter(child: FeedHeader()),
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
                    ref.read(feedSearchQueryProvider.notifier).update(value);
                  },
                ),
          action: selectionMode
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FeedSortButton(
                      selected: selectedSort,
                      onSelected: (value) {
                        ref
                            .read(selectedFeedSortProvider.notifier)
                            .select(value);
                      },
                    ),
                    const SizedBox(width: 8),
                    LibraryCircleButton(
                      icon: Icons.checklist_rounded,
                      tooltip: linkVaultLocalizationsOf(context).selectMultiple,
                      onPressed: () {
                        ref.read(feedSelectionModeProvider.notifier).enable();
                      },
                    ),
                  ],
                ),
          filters: FeedFilterRail(
            filters: filters,
            selectedFilter: selectedFilter,
            onSelected: (filter) {
              ref.read(selectedFeedFilterProvider.notifier).select(filter);
            },
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(36, 28, 36, selectionMode ? 80 : 152),
          sliver: FeedLinksSliver(
            links: links,
            selectedFilter: selectedFilter,
            searchQuery: searchQuery,
            selectionMode: selectionMode,
            selectedIds: selectedIds,
            onOpen: (link) => _openLink(context, ref, link, selectionMode),
            onSelect: (link) {
              ref.read(feedSelectionModeProvider.notifier).enable();
              ref
                  .read(selectedFeedLinkIdsProvider.notifier)
                  .toggle(link.link.id);
            },
            onFavourite: (link) => unawaited(
              ref.read(feedRepositoryProvider).setFavourite([
                link.link.id,
              ], !link.link.isFavourite),
            ),
            onPin: (link) => unawaited(
              ref.read(feedRepositoryProvider).setPinned([
                link.link.id,
              ], !link.link.isPinned),
            ),
          ),
        ),
      ],
    );
  }

  static void _openLink(
    BuildContext context,
    WidgetRef ref,
    LinkWithTags link,
    bool selectionMode,
  ) {
    if (selectionMode) {
      ref.read(selectedFeedLinkIdsProvider.notifier).toggle(link.link.id);
      return;
    }
    unawaited(ref.read(feedRepositoryProvider).markOpened(link.link.id));
    unawaited(showLinkDetailsSheet(context: context, linkId: link.link.id));
  }

  static void _exitSelectionMode(WidgetRef ref) {
    ref.read(feedSelectionModeProvider.notifier).disable();
    ref.read(selectedFeedLinkIdsProvider.notifier).clear();
  }

  static void _toggleVisibleSelections(
    WidgetRef ref,
    List<int> visibleIds,
    bool allVisibleSelected,
  ) {
    if (visibleIds.isEmpty) return;
    final notifier = ref.read(selectedFeedLinkIdsProvider.notifier);
    allVisibleSelected
        ? notifier.removeAll(visibleIds)
        : notifier.addAll(visibleIds);
  }
}
