import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class LinkDetailsCollectionPill extends StatelessWidget {
  const LinkDetailsCollectionPill({super.key, this.collectionName});

  final String? collectionName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.surface(context),
        borderRadius: BorderRadius.circular(27),
      ),
      child: Row(
        children: [
          Text(
            linkVaultLocalizationsOf(context).collection,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const Spacer(),
          Text(
            collectionName?.sentenceDisplayText ??
                linkVaultLocalizationsOf(context).noCollection,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: LinkVaultThemeTokens.secondaryInk(context),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
