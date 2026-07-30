import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

class AddLinkTagChoiceChip extends StatelessWidget {
  const AddLinkTagChoiceChip({
    super.key,
    required this.tag,
    required this.selected,
    required this.onTap,
  });

  final String tag;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ink = LinkVaultThemeTokens.ink(context);
    return Material(
      color: selected ? ink : LinkVaultThemeTokens.surface(context),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          child: Text(
            tag.sentenceDisplayText,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: selected ? Colors.white : ink,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
