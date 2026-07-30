import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/selection_action_rail.dart';

class FeedQuickActions extends StatelessWidget {
  const FeedQuickActions({
    super.key,
    this.onAdd,
    this.onArchive,
    this.onRestore,
    this.onTrash,
    this.onFavourite,
    this.onPin,
    this.onDelete,
    this.favouriteActive = false,
    this.pinActive = false,
  });

  final VoidCallback? onAdd;
  final VoidCallback? onArchive;
  final VoidCallback? onRestore;
  final VoidCallback? onTrash;
  final VoidCallback? onFavourite;
  final VoidCallback? onPin;
  final VoidCallback? onDelete;
  final bool favouriteActive;
  final bool pinActive;

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    final actions = <(String, IconData, VoidCallback)>[
      if (onFavourite != null)
        (
          favouriteActive
              ? localizations.unfavoriteLinks
              : localizations.favoriteLinks,
          favouriteActive
              ? Icons.favorite_rounded
              : Icons.favorite_outline_rounded,
          onFavourite!,
        ),
      if (onPin != null)
        (
          pinActive ? localizations.unpinLinks : localizations.pinLinks,
          pinActive ? Icons.push_pin_rounded : Icons.push_pin_outlined,
          onPin!,
        ),
      if (onRestore != null)
        (localizations.restoreLinks, Icons.restore_rounded, onRestore!),
      if (onArchive != null)
        (localizations.archiveLinks, Icons.archive_outlined, onArchive!),
      if (onTrash != null)
        (localizations.moveToTrash, Icons.delete_outline_rounded, onTrash!),
      if (onDelete != null)
        (
          localizations.deletePermanently,
          Icons.delete_forever_outlined,
          onDelete!,
        ),
      if (onAdd != null)
        (localizations.addLinkAction, Icons.add_rounded, onAdd!),
    ];
    return SelectionActionRail(actions: actions);
  }
}
