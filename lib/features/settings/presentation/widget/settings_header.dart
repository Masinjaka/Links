part of 'settings_widgets.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PageTitle(title: 'SYSTEM', subtitle: 'SETTINGS_v2'),
            SquareButton(
              onPressed: onClose,
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
