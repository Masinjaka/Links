import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class FeedHeader extends StatelessWidget {
  const FeedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        linkVaultLocalizationsOf(context).linksPageTitle,
        style: textTheme.headlineLarge?.copyWith(
          fontFamily: 'Oswald',
          color: LinkVaultThemeTokens.ink(context),
          fontSize: 44,
          fontWeight: FontWeight.w700,
          height: 1,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
