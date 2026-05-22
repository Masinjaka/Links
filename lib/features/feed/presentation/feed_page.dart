import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_empty_state.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_filter_rail.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_header_widget.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_search_strip.dart';
import 'package:linkvault/features/feed/presentation/widgets/kinetic_link_card.dart';
import 'package:linkvault/features/feed/presentation/widgets/quick_action_widget.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/shared/presentation/widgets/square_button_widget.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';

class FeedPage extends ConsumerWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final links = ref.watch(visibleFeedLinksProvider);
    final List<LinkWithTags> visibleLinks = links.maybeWhen(
      data: (items) => items,
      orElse: () => const <LinkWithTags>[],
    );
    final filters =
        ref.watch(feedFiltersProvider).value ?? const [allAssetsFilter];
    final selectedFilter = ref.watch(selectedFeedFilterProvider);
    final searchQuery = ref.watch(feedSearchQueryProvider);
    final selectionMode = ref.watch(feedSelectionModeProvider);
    final selectedLinkIds = ref.watch(selectedFeedLinkIdsProvider);
    final visibleIds = visibleLinks
        .map((item) => item.link.id)
        .toList(growable: false);
    final allVisibleSelected =
        visibleIds.isNotEmpty &&
        visibleIds.every((id) => selectedLinkIds.contains(id));
    final overlay = selectionMode
        ? (selectedLinkIds.isEmpty
              ? null
              : FeedQuickActions(
                  onArchive: () => _archiveSelectedLinks(context, ref),
                ))
        : FeedQuickActions(onAdd: () => context.go('/add'));
    final overlayWidgets = overlay == null ? const <Widget>[] : [overlay];

    return Scaffold(
      backgroundColor: LinkVaultThemeTokens.background(context),
      body: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(child: VelocityKineticBackground()),
          ),
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 168),
              children: [
                const FeedHeader(),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: selectionMode
                          ? _FeedSelectAllStrip(
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
                                    .read(feedSearchQueryProvider.notifier)
                                    .update(value);
                              },
                            ),
                    ),
                    if (!selectionMode) ...[
                      const SizedBox(width: 16),
                      SquareButton(
                        onPressed: () {
                          ref.read(feedSelectionModeProvider.notifier).enable();
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
                    ref
                        .read(selectedFeedFilterProvider.notifier)
                        .select(filter);
                  },
                ),
                const SizedBox(height: 32),
                ...links.when(
                  data: (items) => [
                    if (items.isEmpty)
                      const FeedEmptyState()
                    else
                      for (final (index, link) in items.indexed) ...[
                        KineticLinkCard(
                              key: ValueKey(
                                'feed-link-${link.link.id}-$selectionMode-${selectedLinkIds.contains(link.link.id)}',
                              ),
                              link: link,
                              selected: selectedLinkIds.contains(link.link.id),
                              leading: selectionMode
                                  ? _FeedSelectionCheckbox(
                                      selected: selectedLinkIds.contains(
                                        link.link.id,
                                      ),
                                    )
                                  : null,
                              onOpen: () {
                                if (selectionMode) {
                                  ref
                                      .read(
                                        selectedFeedLinkIdsProvider.notifier,
                                      )
                                      .toggle(link.link.id);
                                  return;
                                }

                                context.go('/details?id=${link.link.id}');
                              },
                            )
                            .animate(
                              key: ValueKey(
                                'feed-card-$selectedFilter-$searchQuery-$selectionMode-${link.link.id}',
                              ),
                              delay: (70 * index).ms,
                            )
                            .fadeIn(duration: 280.ms)
                            .slideY(
                              begin: .08,
                              end: 0,
                              curve: Curves.easeOutCubic,
                            ),
                        if (index != items.length - 1)
                          const SizedBox(height: 16),
                      ],
                  ],
                  error: (error, stackTrace) => [
                    Text(
                      'DATABASE_ERROR',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                  loading: () => [
                    Center(
                      child: CircularProgressIndicator(
                        color: LinkVaultColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ...overlayWidgets,
        ],
      ),
    );
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
    if (visibleIds.isEmpty) {
      return;
    }

    final notifier = ref.read(selectedFeedLinkIdsProvider.notifier);
    if (allVisibleSelected) {
      notifier.removeAll(visibleIds);
      return;
    }

    notifier.addAll(visibleIds);
  }

  static Future<void> _archiveSelectedLinks(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final selectedIds = ref.read(selectedFeedLinkIdsProvider);
    if (selectedIds.isEmpty) {
      return;
    }

    final confirmed = await showArchiveLinksDialog(context, selectedIds.length);
    if (!confirmed) {
      return;
    }

    await ref.read(feedRepositoryProvider).archiveLinks(selectedIds);
    _exitSelectionMode(ref);
  }
}

class _FeedSelectAllStrip extends StatelessWidget {
  const _FeedSelectAllStrip({
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
                    _FeedSelectionCheckbox(selected: selected),
                    const SizedBox(width: 14),
                    Text(
                      'SELECT_ALL',
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
              child: const Text('CANCEL'),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedSelectionCheckbox extends StatelessWidget {
  const _FeedSelectionCheckbox({required this.selected});

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

Future<bool> showArchiveLinksDialog(
  BuildContext context,
  int selectionCount,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) {
      final ink = LinkVaultThemeTokens.ink(context);
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: LinkVaultThemeTokens.surface(context),
            // border: Border.all(color: ink),
            borderRadius: LinkVaultThemeTokens.componentRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ARCHIVE_LINKS',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Archive $selectionCount selected link${selectionCount == 1 ? '' : 's'}? Archived links will leave the active feed and move to archive.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: VelocityButton(
                      label: 'CANCEL',
                      filled: false,
                      borderColor: ink,
                      foregroundColor: ink,
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: VelocityButton(
                      label: 'ARCHIVE',
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  return confirmed == true;
}
