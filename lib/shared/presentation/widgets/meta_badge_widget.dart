import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

class MetaBadge extends StatelessWidget {
  const MetaBadge({
    super.key,
    required this.label,
    this.filled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
    this.fontSize,
    this.maxLines,
    this.overflow,
  });

  final String label;
  final bool filled;
  final EdgeInsetsGeometry padding;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final ink = LinkVaultThemeTokens.ink(context);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: filled ? ink : Colors.transparent,
        border: filled ? null : Border.all(color: ink),
        borderRadius: LinkVaultThemeTokens.componentRadius,
      ),
      child: Text(
        label.displayText,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontFamily: 'OpenSans',
          color: filled
              ? LinkVaultThemeTokens.onInk(context)
              : LinkVaultThemeTokens.secondaryInk(context),
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
