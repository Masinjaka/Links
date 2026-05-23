import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

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
    final textStyle = GoogleFonts.openSans(
      textStyle: Theme.of(context).textTheme.labelLarge,
      color: selected ? LinkVaultColors.onPrimary : ink,
      fontWeight: FontWeight.w800,
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
          height: 42,
          constraints: const BoxConstraints(minWidth: 96),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            // border: Border.all(color: selected ? Colors.transparent : ink),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selected) ...[
                Icon(
                  Icons.check_rounded,
                  color: LinkVaultColors.onPrimary,
                  size: 18,
                ),
                const SizedBox(width: 8),
              ],
              Text(label.displayText, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
