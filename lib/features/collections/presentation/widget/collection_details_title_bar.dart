import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

class CollectionDetailsTitleBar extends StatelessWidget {
  const CollectionDetailsTitleBar({
    super.key,
    required this.title,
    required this.onClose,
  });

  final String title;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title.sentenceDisplayText.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontFamily: 'Oswald',
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        IconButton(
          key: const Key('collection-details-close'),
          onPressed: onClose,
          tooltip: linkVaultLocalizationsOf(context).close,
          icon: const Icon(Icons.close_rounded, size: 24),
        ),
      ],
    );
  }
}
