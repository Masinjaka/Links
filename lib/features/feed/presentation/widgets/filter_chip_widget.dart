import 'package:flutter/material.dart';
import 'package:linkvault/app/linkvault_theme.dart';

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
      color: selected ? LinkVaultColors.onPrimary : ink,
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
              Text(label, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
