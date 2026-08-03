import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/feed/presentation/feed_selection_commands.dart';
import 'package:linkvault/features/feed/presentation/widgets/quick_action_widget.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';

class FeedSelectionOverlay extends ConsumerWidget {
  const FeedSelectionOverlay({
    super.key,
    required this.selectedFilter,
    required this.allFavourite,
    required this.allPinned,
  });

  final String selectedFilter;
  final bool allFavourite;
  final bool allPinned;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commands = FeedSelectionCommands(context, ref);
    return switch (selectedFilter) {
      trashFilter => FeedQuickActions(
        onRestore: commands.restore,
        onDelete: commands.deletePermanently,
      ),
      archiveFilter => FeedQuickActions(
        onRestore: commands.restore,
        onDelete: commands.deletePermanently,
      ),
      _ => FeedQuickActions(
        favouriteActive: allFavourite,
        pinActive: allPinned,
        onFavourite: () => commands.favourite(!allFavourite),
        onPin: () => commands.pin(!allPinned),
        onArchive: commands.archive,
        onDelete: commands.deletePermanently,
      ),
    };
  }
}
