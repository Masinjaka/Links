import 'package:flutter/material.dart';
import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class FeedFilterChip extends StatelessWidget {
  const FeedFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ink = LinkVaultThemeTokens.ink(context);
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
      fontFamily: 'OpenSans',
      color: selected ? LinkVaultColors.onPrimary : ink,
      fontSize: 13,
      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
    );

    return Material(
      color: selected
          ? LinkVaultColors.primary
          : LinkVaultThemeTokens.surface(context),
      borderRadius: LinkVaultThemeTokens.componentRadius,
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(_displayLabel(context, label), style: textStyle)],
          ),
        ),
      ),
    );
  }

  String _displayLabel(BuildContext context, String value) {
    final strings = linkVaultLocalizationsOf(context);
    if (value == 'ALL_ASSETS' || value == 'ALL_COLLECTIONS') {
      return strings.all;
    }
    if (value == 'INBOX') return strings.inbox;
    if (value == 'FAVOURITES') return strings.favorites;
    if (value == 'TRASH') return strings.trash;
    return value.sentenceDisplayText;
  }
}
