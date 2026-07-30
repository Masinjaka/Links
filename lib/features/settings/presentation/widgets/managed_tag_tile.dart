import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_selection_checkbox.dart';
import 'package:linkvault/features/settings/repository/managed_tag.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class ManagedTagTile extends StatelessWidget {
  const ManagedTagTile({
    super.key,
    required this.tag,
    required this.assetLabel,
    required this.selectionMode,
    required this.selected,
    required this.onTap,
  });

  final ManagedTag tag;
  final String assetLabel;
  final bool selectionMode;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final countLabel = linkVaultLocalizationsOf(
      context,
    ).tagUsage(tag.usageCount, assetLabel);
    return Material(
      color: LinkVaultThemeTokens.surface(context),
      borderRadius: LinkVaultThemeTokens.componentRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tag.name.sentenceDisplayText,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        countLabel,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                if (selectionMode) FeedSelectionCheckbox(selected: selected),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
