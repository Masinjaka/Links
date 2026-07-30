import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class LinkDetailsOpenButton extends StatelessWidget {
  const LinkDetailsOpenButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton.icon(
        key: const Key('link-details-open'),
        onPressed: onPressed,
        icon: const Icon(Icons.open_in_new_rounded, size: 18),
        label: Text(linkVaultLocalizationsOf(context).openLink),
        style: FilledButton.styleFrom(
          backgroundColor: LinkVaultColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: const StadiumBorder(),
          textStyle: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
