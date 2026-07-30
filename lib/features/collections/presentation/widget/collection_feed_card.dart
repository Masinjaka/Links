part of 'collections_widgets.dart';

class CollectionFeedCard extends StatelessWidget {
  const CollectionFeedCard({
    super.key,
    required this.group,
    this.onOpen,
    this.selectionMode = false,
    this.selected = false,
    this.onToggleSelection,
  });

  final CollectionWithCount group;
  final VoidCallback? onOpen;
  final bool selectionMode;
  final bool selected;
  final VoidCallback? onToggleSelection;

  @override
  Widget build(BuildContext context) {
    final collection = group.collection;
    final onTap = selectionMode ? onToggleSelection : onOpen;
    return Material(
      key: const Key('collection-feed-card-surface'),
      color: LinkVaultThemeTokens.surface(context),
      borderRadius: BorderRadius.circular(22),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        onLongPress: selectionMode ? null : onToggleSelection,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: const BoxConstraints(minHeight: 104),
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  SizedBox(
                    height: CollectionPreviewStack.size.height,
                    child: constraints.maxWidth < 280
                        ? Row(
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: _CollectionCompactCardContent(
                                        group: group,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    _collectionIcon(
                                      context,
                                      collection.iconKey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              CollectionPreviewStack(
                                iconKey: collection.iconKey,
                                imageUrls: group.previewImageUrls,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: _content(context)),
                                    const SizedBox(width: 8),
                                    _collectionIcon(
                                      context,
                                      collection.iconKey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                  if (selectionMode)
                    Positioned(
                      left: 0,
                      top: 0,
                      child: _CollectionSelectionCheckbox(selected: selected),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    final collection = group.collection;
    final localizations = linkVaultLocalizationsOf(context);
    return Column(
      key: const Key('collection-card-content'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          collection.title.sentenceDisplayText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Flexible(child: _tag(context, collection.tagName)),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                localizations.linkCount(group.count),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: LinkVaultThemeTokens.ink(context),
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _tag(BuildContext context, String tagName) {
    final label = tagName.trim().isEmpty
        ? linkVaultLocalizationsOf(context).general
        : tagName.sentenceDisplayText;
    return Container(
      constraints: const BoxConstraints(minWidth: 48),
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.ink(context),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: LinkVaultThemeTokens.onInk(context),
          height: 1.1,
        ),
      ),
    );
  }

  Widget _collectionIcon(BuildContext context, String iconKey) {
    return Container(
      key: const Key('collection-card-icon'),
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.background(context).withValues(alpha: .48),
        shape: BoxShape.circle,
      ),
      child: Icon(
        collectionIconForKey(iconKey),
        size: 19,
        color: LinkVaultThemeTokens.ink(context),
      ),
    );
  }
}
