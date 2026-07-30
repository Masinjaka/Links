import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_empty_state.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_selection_checkbox.dart';
import 'package:linkvault/features/feed/presentation/widgets/kinetic_link_card.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class FeedLinksSliver extends StatelessWidget {
  const FeedLinksSliver({
    super.key,
    required this.links,
    required this.selectedFilter,
    required this.searchQuery,
    required this.selectionMode,
    required this.selectedIds,
    required this.onOpen,
    required this.onSelect,
    required this.onFavourite,
    required this.onPin,
  });

  final AsyncValue<List<LinkWithTags>> links;
  final String selectedFilter;
  final String searchQuery;
  final bool selectionMode;
  final Set<int> selectedIds;
  final ValueChanged<LinkWithTags> onOpen;
  final ValueChanged<LinkWithTags> onSelect;
  final ValueChanged<LinkWithTags> onFavourite;
  final ValueChanged<LinkWithTags> onPin;

  @override
  Widget build(BuildContext context) {
    return links.when(
      data: (items) {
        if (items.isEmpty) {
          return const SliverToBoxAdapter(child: FeedEmptyState());
        }

        return SliverList.separated(
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final link = items[index];
            final selected = selectedIds.contains(link.link.id);
            return KineticLinkCard(
                  key: ValueKey(
                    'feed-link-${link.link.id}-$selectionMode-$selected',
                  ),
                  link: link,
                  selected: selected,
                  leading: selectionMode
                      ? FeedSelectionCheckbox(selected: selected)
                      : null,
                  onOpen: () => onOpen(link),
                  onLongPress: () => onSelect(link),
                  onFavourite: () => onFavourite(link),
                  onPin: () => onPin(link),
                )
                .animate(
                  key: ValueKey(
                    'feed-card-$selectedFilter-$searchQuery-'
                    '$selectionMode-${link.link.id}',
                  ),
                  delay: (70 * index).ms,
                )
                .fadeIn(duration: 280.ms)
                .slideY(begin: .08, end: 0, curve: Curves.easeOutCubic);
          },
        );
      },
      error: (_, _) => SliverToBoxAdapter(
        child: Text(
          linkVaultLocalizationsOf(context).databaseError,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      loading: () => SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(color: LinkVaultColors.primary),
        ),
      ),
    );
  }
}
