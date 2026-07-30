import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/feed/presentation/widgets/link_card_action_button.dart';
import 'package:linkvault/features/feed/presentation/widgets/link_card_display_formatters.dart';
import 'package:linkvault/features/feed/presentation/widgets/link_preview_thumbnail.dart';
import 'package:linkvault/features/feed/presentation/widgets/link_tag_pill.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

class KineticLinkCard extends StatelessWidget {
  const KineticLinkCard({
    super.key,
    required this.link,
    this.onOpen,
    this.onLongPress,
    this.onFavourite,
    this.onPin,
    this.trailing,
    this.leading,
    this.selected = false,
  });

  final LinkWithTags link;
  final VoidCallback? onOpen;
  final VoidCallback? onLongPress;
  final VoidCallback? onFavourite;
  final VoidCallback? onPin;
  final Widget? trailing;
  final Widget? leading;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: LinkVaultThemeTokens.surface(context),
      borderRadius: BorderRadius.circular(22),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onOpen,
        onLongPress: onLongPress,
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: LinkPreviewThumbnail.size + 20,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    LinkPreviewThumbnail(imageUrl: linkPreviewImageUrl(link)),
                    const SizedBox(width: 10),
                    Expanded(child: _content(context)),
                  ],
                ),
              ),
            ),
            if (leading != null) Positioned(left: 4, top: 4, child: leading!),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ink = LinkVaultThemeTokens.ink(context);

    return SizedBox(
      height: LinkPreviewThumbnail.size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  link.link.displayUrl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: LinkVaultThemeTokens.secondaryInk(context),
                    height: 1.1,
                  ),
                ),
              ),
              if (onPin != null || link.link.isPinned) ...[
                const SizedBox(width: 4),
                LinkCardActionButton(
                  icon: link.link.isPinned
                      ? Icons.push_pin_rounded
                      : Icons.push_pin_outlined,
                  tooltip: linkVaultLocalizationsOf(context).pinLinkTooltip,
                  onPressed: onPin,
                ),
              ],
              if (onFavourite != null || link.link.isFavourite) ...[
                const SizedBox(width: 4),
                LinkCardActionButton(
                  icon: link.link.isFavourite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  tooltip: linkVaultLocalizationsOf(
                    context,
                  ).favoriteLinkTooltip,
                  onPressed: onFavourite,
                ),
              ],
              if (trailing != null) ...[const SizedBox(width: 4), trailing!],
            ],
          ),
          const SizedBox(height: 4),
          Text(
            link.link.title.sentenceDisplayText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(
              color: ink,
              fontWeight: FontWeight.w800,
              height: 1.05,
            ),
          ),
          const Spacer(),
          if (link.tags.isNotEmpty) LinkTagPill(label: link.tags.first.name),
        ],
      ),
    );
  }
}
