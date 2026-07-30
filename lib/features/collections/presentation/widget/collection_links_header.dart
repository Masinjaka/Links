import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';

class CollectionLinksHeader extends StatelessWidget {
  const CollectionLinksHeader({super.key, required this.onOptions});

  final VoidCallback onOptions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          linkVaultLocalizationsOf(context).links,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
        const Spacer(),
        IconButton(
          key: const Key('collection-options-button'),
          onPressed: onOptions,
          tooltip: linkVaultLocalizationsOf(context).options,
          icon: const Icon(Icons.more_horiz_rounded, size: 22),
        ),
      ],
    );
  }
}
