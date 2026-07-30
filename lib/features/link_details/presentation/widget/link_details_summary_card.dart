part of 'link_details_widgets.dart';

class LinkDetailsSummaryCard extends StatelessWidget {
  const LinkDetailsSummaryCard({
    super.key,
    required this.link,
    required this.onAction,
  });

  final LinkWithTags link;
  final ValueChanged<LinkMenuAction> onAction;

  @override
  Widget build(BuildContext context) {
    final surface = LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);
    final readingTime = link.link.readingTime.trim();

    return Material(
      color: surface,
      borderRadius: BorderRadius.circular(22),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PreviewPanel(link: link),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 10, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        link.link.title.sentenceDisplayText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: ink,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    LinkActionsMenu(link: link.link, onSelected: onAction),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  linkVaultLocalizationsOf(context).summary,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ink,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  link.link.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ink,
                    fontSize: 12,
                    height: 1.2,
                  ),
                ),
                if (readingTime.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_outlined,
                        size: 15,
                        color: LinkVaultThemeTokens.secondaryInk(context),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        readingTime.sentenceDisplayText,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: LinkVaultThemeTokens.secondaryInk(context),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
