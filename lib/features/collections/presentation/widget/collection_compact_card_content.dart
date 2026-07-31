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
        Text(
          collection.title.sentenceDisplayText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          linkVaultLocalizationsOf(context).linkCount(group.count),
          key: const Key('collection-card-link-count'),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: LinkVaultThemeTokens.ink(context),
            fontWeight: FontWeight.w400,
            height: 1.1,
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.centerLeft,
          child: _tag(context, collection.tagName),
        ),
      ],
    );
  }

  Widget _tag(BuildContext context, String tagName) {
    final label = tagName.trim().isEmpty
        ? linkVaultLocalizationsOf(context).general
        : tagName.sentenceDisplayText;
    return Container(
      key: const Key('collection-card-tag'),
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
