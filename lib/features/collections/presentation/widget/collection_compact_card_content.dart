part of 'collections_widgets.dart';

class _CollectionCompactCardContent extends StatelessWidget {
  const _CollectionCompactCardContent({required this.group});

  final CollectionWithCount group;

  @override
  Widget build(BuildContext context) {
    final collection = group.collection;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                collection.title.sentenceDisplayText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Flexible(child: _tag(context, collection.tagName)),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                linkVaultLocalizationsOf(context).linkCount(group.count),
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
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: LinkVaultThemeTokens.onInk(context),
          height: 1.1,
        ),
      ),
    );
  }
}
