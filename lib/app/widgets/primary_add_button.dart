import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class PrimaryAddButton extends StatelessWidget {
  const PrimaryAddButton({
    super.key,
    required this.onPressed,
    this.expanded = false,
  });

  final VoidCallback onPressed;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: linkVaultLocalizationsOf(context).add,
      child: Material(
        key: const Key('primary-add-button-material'),
        color: LinkVaultThemeTokens.primary(context),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox.square(
            dimension: 56,
            child: AnimatedRotation(
              turns: expanded ? .125 : 0,
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              child: const Icon(
                Icons.add_rounded,
                size: 34,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
