import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class FeedSelectionCheckbox extends StatelessWidget {
  const FeedSelectionCheckbox({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? LinkVaultColors.primary
        : LinkVaultThemeTokens.ink(context);
    return Container(
      key: const Key('feed-selection-checkbox'),
      width: 28,
      height: 28,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.surface(context),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: selected
              ? LinkVaultColors.primary
              : LinkVaultThemeTokens.surface(context),
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: selected
            ? Icon(
                Icons.check_rounded,
                size: 16,
                color: LinkVaultColors.onPrimary,
              )
            : null,
      ),
    );
  }
}
