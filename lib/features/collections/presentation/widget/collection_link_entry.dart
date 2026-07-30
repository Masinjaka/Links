part of 'collection_details_widgets.dart';

class CollectionLinkEntry extends StatelessWidget {
  const CollectionLinkEntry({
    super.key,
    required this.link,
    required this.onOpen,
    required this.onRemove,
  });

  final LinkWithTags link;
  final VoidCallback onOpen;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return KineticLinkCard(
      link: link,
      onOpen: onOpen,
      trailing: SquareButton(
        onPressed: onRemove,
        tooltip: linkVaultLocalizationsOf(context).removeFromCollection,
        icon: Icons.remove_rounded,
        size: 38,
        backgroundColor: LinkVaultThemeTokens.surface(context),
        iconColor: LinkVaultColors.primary,
        shadowed: false,
        borderColor: LinkVaultColors.ink,
      ),
    );
  }
}
