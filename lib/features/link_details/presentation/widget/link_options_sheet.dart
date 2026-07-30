import 'package:flutter/material.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/link_details/presentation/widget/link_menu_action.dart';
import 'package:linkvault/shared/presentation/widgets/library_bottom_sheet.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

Future<void> showLinkOptionsSheet({
  required BuildContext context,
  required Link link,
  required ValueChanged<LinkMenuAction> onSelected,
}) {
  return showLibraryBottomSheet<void>(
    context: context,
    surfaceKey: const Key('link-options-sheet'),
    heightFactor: .39,
    builder: (_) => LinkOptionsSheet(link: link, onSelected: onSelected),
  );
}

class LinkOptionsSheet extends StatelessWidget {
  const LinkOptionsSheet({
    super.key,
    required this.link,
    required this.onSelected,
  });

  final Link link;
  final ValueChanged<LinkMenuAction> onSelected;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final strings = linkVaultLocalizationsOf(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 14 + bottomInset),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            strings.options,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          _option(
            context,
            LinkMenuAction.edit,
            Icons.edit_outlined,
            strings.edit,
          ),
          _option(
            context,
            LinkMenuAction.share,
            Icons.share_outlined,
            strings.share,
          ),
          _option(
            context,
            LinkMenuAction.favourite,
            link.isFavourite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            link.isFavourite ? strings.removeFavorite : strings.markAsFavorite,
          ),
          _option(
            context,
            LinkMenuAction.pin,
            link.isPinned ? Icons.push_pin_rounded : Icons.push_pin_outlined,
            link.isPinned ? strings.unpin : strings.pin,
          ),
          _option(
            context,
            LinkMenuAction.archive,
            Icons.archive_outlined,
            strings.archive,
          ),
          _option(
            context,
            LinkMenuAction.trash,
            Icons.delete_outline_rounded,
            strings.delete,
          ),
        ],
      ),
    );
  }

  Widget _option(
    BuildContext context,
    LinkMenuAction action,
    IconData icon,
    String label,
  ) {
    return InkWell(
      key: ValueKey('link-option-${action.name}'),
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
