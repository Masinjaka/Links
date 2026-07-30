import 'package:flutter/material.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_menu_action.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_bottom_sheet.dart';

Future<void> showCollectionOptionsSheet({
  required BuildContext context,
  required Collection collection,
  required ValueChanged<CollectionMenuAction> onSelected,
}) {
  return showLibraryBottomSheet<void>(
    context: context,
    surfaceKey: const Key('collection-options-sheet'),
    heightFactor: .39,
    builder: (_) =>
        CollectionOptionsSheet(collection: collection, onSelected: onSelected),
  );
}

class CollectionOptionsSheet extends StatelessWidget {
  const CollectionOptionsSheet({
    super.key,
    required this.collection,
    required this.onSelected,
  });

  final Collection collection;
  final ValueChanged<CollectionMenuAction> onSelected;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final localizations = linkVaultLocalizationsOf(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 14 + bottomInset),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            localizations.options,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          _option(
            context,
            CollectionMenuAction.edit,
            Icons.edit_outlined,
            localizations.edit,
          ),
          _option(
            context,
            CollectionMenuAction.selectLinks,
            Icons.checklist_rounded,
            localizations.selectLinks,
          ),
          _option(
            context,
            CollectionMenuAction.favourite,
            collection.isFavourite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            collection.isFavourite
                ? localizations.removeFavorite
                : localizations.markAsFavorite,
          ),
          _option(
            context,
            CollectionMenuAction.pin,
            collection.isPinned
                ? Icons.push_pin_rounded
                : Icons.push_pin_outlined,
            collection.isPinned ? localizations.unpin : localizations.pin,
          ),
          _option(
            context,
            CollectionMenuAction.archive,
            Icons.archive_outlined,
            localizations.archive,
          ),
          _option(
            context,
            CollectionMenuAction.delete,
            Icons.delete_outline_rounded,
            localizations.delete,
          ),
        ],
      ),
    );
  }

  Widget _option(
    BuildContext context,
    CollectionMenuAction action,
    IconData icon,
    String label,
  ) {
    return InkWell(
      key: ValueKey('collection-option-${action.name}'),
      onTap: () {
        Navigator.of(context).pop();
        Future<void>.microtask(() => onSelected(action));
      },
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 39,
        child: Row(
          children: [
            Icon(icon, size: 19),
            const SizedBox(width: 12),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
