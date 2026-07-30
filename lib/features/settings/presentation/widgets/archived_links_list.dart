import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/feed/presentation/widgets/feed_selection_checkbox.dart';
import 'package:linkvault/features/feed/presentation/widgets/kinetic_link_card.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/link_details/presentation/show_link_details_sheet.dart';
import 'package:linkvault/shared/presentation/widgets/library_empty_state.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class ArchivedLinksList extends ConsumerWidget {
  const ArchivedLinksList({
    super.key,
    required this.links,
    required this.selectionMode,
    required this.selectedIds,
    required this.onToggleSelection,
  });

  final AsyncValue<List<LinkWithTags>> links;
  final bool selectionMode;
  final Set<int> selectedIds;
  final ValueChanged<int> onToggleSelection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return links.when(
      data: (items) {
        if (items.isEmpty) {
          return LibraryEmptyState(
            title: linkVaultLocalizationsOf(context).noArchivedLinks,
          );
        }
        return ListView.separated(
          key: const Key('archived-links-list'),
          padding: const EdgeInsets.fromLTRB(32, 28, 32, 40),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = items[index];
            final id = item.link.id;
            return KineticLinkCard(
                  key: ValueKey('archived-link-$id-$selectionMode'),
                  link: item,
                  selected: selectedIds.contains(id),
                  leading: selectionMode
                      ? FeedSelectionCheckbox(
                          selected: selectedIds.contains(id),
                        )
                      : null,
                  onOpen: selectionMode
                      ? () => onToggleSelection(id)
                      : () =>
                            showLinkDetailsSheet(context: context, linkId: id),
                  onLongPress: () => onToggleSelection(id),
                  onFavourite: () => unawaited(
                    ref.read(feedRepositoryProvider).setFavourite([
                      id,
                    ], !item.link.isFavourite),
                  ),
                  onPin: () => unawaited(
                    ref.read(feedRepositoryProvider).setPinned([
                      id,
                    ], !item.link.isPinned),
                  ),
                )
                .animate(delay: (70 * index).ms)
                .fadeIn(duration: 280.ms)
                .slideY(begin: .08, end: 0, curve: Curves.easeOutCubic);
          },
        );
      },
      error: (_, _) =>
          Center(child: Text(linkVaultLocalizationsOf(context).databaseError)),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
