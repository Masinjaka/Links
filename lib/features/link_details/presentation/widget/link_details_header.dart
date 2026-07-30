import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class LinkDetailsHeader extends StatelessWidget {
  const LinkDetailsHeader({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            linkVaultLocalizationsOf(context).linkDetails.toUpperCase(),
            maxLines: 1,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: LinkVaultThemeTokens.ink(context),
              fontFamily: 'Oswald',
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        IconButton(
          key: const Key('link-details-close'),
          onPressed: onClose,
          tooltip: linkVaultLocalizationsOf(context).close,
          icon: Icon(
            Icons.close_rounded,
            size: 24,
            color: LinkVaultThemeTokens.ink(context),
          ),
        ),
      ],
    );
  }
}
