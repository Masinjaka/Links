import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class LinkDetailsTagSection extends StatelessWidget {
  const LinkDetailsTagSection({
    super.key,
    required this.tags,
    required this.onAdd,
  });

  final List<Tag> tags;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              linkVaultLocalizationsOf(context).tags,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 10),
            Material(
              color: LinkVaultColors.primary,
              shape: const CircleBorder(),
              child: InkWell(
                key: const Key('link-details-add-tag'),
                onTap: onAdd,
                customBorder: const CircleBorder(),
                child: const SizedBox.square(
                  dimension: 20,
                  child: Icon(Icons.add_rounded, color: Colors.white, size: 14),
                ),
              ),
            ),
          ],
        ),
        if (tags.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tag in tags)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: LinkVaultThemeTokens.ink(context),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    tag.name.sentenceDisplayText,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: LinkVaultThemeTokens.onInk(context),
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
