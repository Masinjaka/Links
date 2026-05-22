part of 'onboarding_widgets.dart';

class OnboardingStepView extends StatelessWidget {
  const OnboardingStepView({
    super.key,
    required this.step,
    required this.platforms,
  });

  final VaultOnboardingStep step;
  final List<BrowserPlatformOption> platforms;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VelocityPanel(
          padding: EdgeInsets.zero,
          backgroundColor: step.number == '01'
              ? LinkVaultColors.primary.withValues(alpha: .82)
              : LinkVaultThemeTokens.surface(context),
          child: SizedBox(
            height: step.number == '02' ? 460 : 420,
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    _stepIcon(step.iconKey),
                    color: step.stepNumber == '03'
                        ? LinkVaultColors.success
                        : step.stepNumber == '01'
                        ? LinkVaultColors.onPrimary
                        : LinkVaultThemeTokens.ink(context),
                    size: step.stepNumber == '03' ? 210 : 280,
                  ),
                ),
                Positioned(
                  left: 34,
                  bottom: 34,
                  child: Container(
                    color: LinkVaultColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 34,
                      vertical: 28,
                    ),
                    child: Text(
                      step.stepNumber,
                      style: textTheme.headlineMedium?.copyWith(fontSize: 30),
                    ),
                  ),
                ),
                if (step.stepNumber == '02')
                  const Positioned(
                    right: 0,
                    bottom: 0,
                    child: ColoredBox(
                      color: Color(0xFFFFEFA8),
                      child: SizedBox(width: 150, height: 190),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 48),
        Text(
          step.title,
          style: textTheme.headlineLarge?.copyWith(fontSize: 36, height: 1),
        ),
        const SizedBox(height: 26),
        Text(
          step.description,
          style: textTheme.bodyLarge?.copyWith(
            color: LinkVaultColors.secondary,
            fontSize: 17,
          ),
        ),
        if (step.showPlatforms) ...[
          const SizedBox(height: 52),
          Center(
            child: Text(
              'SUPPORTED_PLATFORMS',
              style: textTheme.labelLarge?.copyWith(
                color: LinkVaultColors.secondary,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 18),
          for (final platform in platforms) ...[
            ExtensionBadge(label: platform.name),
            const SizedBox(height: 16),
          ],
        ],
      ],
    );
  }

  IconData _stepIcon(String iconKey) {
    return switch (iconKey) {
      'browser' => Icons.web_asset_rounded,
      'search' => Icons.saved_search_rounded,
      _ => Icons.circle_outlined,
    };
  }
}
