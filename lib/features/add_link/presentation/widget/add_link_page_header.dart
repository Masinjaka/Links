part of 'add_link_widgets.dart';

class AddLinkPageHeader extends StatelessWidget {
  const AddLinkPageHeader({
    super.key,
    required this.onBack,
    required this.label,
  });

  final VoidCallback onBack;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageTitle(title: 'ADD', subtitle: 'LINNKS'),
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
