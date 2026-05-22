part of 'add_collection_widgets.dart';

class AddCollectionPageHeader extends StatelessWidget {
  const AddCollectionPageHeader({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PageTitle(title: 'ADD', subtitle: 'COLLECTION'),
            SquareButton(
              onPressed: onBack,
              backgroundColor: LinkVaultThemeTokens.surface(context),
              icon: Icons.close_sharp,
              iconColor: LinkVaultColors.primary,
              shadowed: false,
              tooltip: 'CLOSE',
              size: 45,
              borderColor: LinkVaultColors.ink,
            ),
          ],
        ),
      ],
    );
  }
}
