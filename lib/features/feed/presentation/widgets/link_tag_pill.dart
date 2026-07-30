import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

class LinkTagPill extends StatelessWidget {
  const LinkTagPill({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.ink(context),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label.lowerDisplayText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: LinkVaultThemeTokens.onInk(context),
          height: 1.1,
        ),
      ),
    );
  }
}
