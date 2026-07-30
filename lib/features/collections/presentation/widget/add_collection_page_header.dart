part of 'add_collection_widgets.dart';

class AddCollectionPageHeader extends StatelessWidget {
  const AddCollectionPageHeader({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              linkVaultLocalizationsOf(context).addCollections,
              style: textTheme.titleLarge?.copyWith(
                color: LinkVaultThemeTokens.ink(context),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SquareButton(
              onPressed: onBack,
              backgroundColor: LinkVaultThemeTokens.surface(context),
              icon: Icons.close_sharp,
              iconColor: LinkVaultColors.primary,
              shadowed: false,
              tooltip: linkVaultLocalizationsOf(context).close,
              size: 45,
              borderColor: LinkVaultColors.ink,
            ),
          ],
        ),
      ],
    );
  }
}
