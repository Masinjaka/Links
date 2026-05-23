part of 'onboarding_widgets.dart';

class ExtensionBadge extends StatelessWidget {
  const ExtensionBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return VelocityPanel(
      borderColor: LinkVaultColors.primary,
      redRight: false,
      redBottom: false,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
      child: Row(
        children: [
          Icon(Icons.public_rounded, color: LinkVaultThemeTokens.ink(context)),
          const SizedBox(width: 24),
          Text(
            label.displayText,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
