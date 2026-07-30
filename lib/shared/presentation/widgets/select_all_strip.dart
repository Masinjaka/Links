import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class SelectAllStrip extends StatelessWidget {
  const SelectAllStrip({
    super.key,
    required this.selected,
    required this.onTap,
    required this.onCancel,
  });

  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ink = LinkVaultThemeTokens.ink(context);
    final localizations = linkVaultLocalizationsOf(context);

    return Material(
      color: Colors.transparent,
      borderRadius: LinkVaultThemeTokens.componentRadius,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: LinkVaultThemeTokens.surface(context),
          borderRadius: LinkVaultThemeTokens.componentRadius,
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onTap,
                borderRadius: LinkVaultThemeTokens.componentRadius,
                child: Row(
                  children: [
                    _checkbox(context),
                    const SizedBox(width: 10),
                    Text(
                      localizations.selectAll,
                      style: textTheme.bodySmall?.copyWith(
                        color: ink,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: onCancel,
              style: TextButton.styleFrom(
                foregroundColor: LinkVaultColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(localizations.cancel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkbox(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: selected
            ? LinkVaultColors.primary
            : LinkVaultThemeTokens.surface(context),
        border: Border.all(
          color: selected
              ? LinkVaultColors.primary
              : LinkVaultThemeTokens.ink(context),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: selected
          ? Icon(
              Icons.check_rounded,
              size: 14,
              color: LinkVaultColors.onPrimary,
            )
          : null,
    );
  }
}
