import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/onboarding/presentation/widget/onboarding_widgets.dart';
import 'package:linkvault/features/onboarding/provider/onboarding_providers.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final steps = ref.watch(onboardingStepsProvider).value ?? const [];
    final platforms = ref.watch(browserPlatformsProvider).value ?? const [];

    return VelocityPage(
      spacing: 64,
      bottomInset: 64,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LINK',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: LinkVaultColors.secondary,
                        fontSize: 18,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      'VAULT',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                VelocityButton(
                  label: linkVaultLocalizationsOf(context).skipIntro,
                  filled: false,
                  height: 44,
                  onPressed: () => context.go('/'),
                ),
              ],
            ),
          ],
        ),
        for (final step in steps)
          OnboardingStepView(step: step, platforms: platforms),
        VelocityButton(
          label: linkVaultLocalizationsOf(context).initializeVault,
          icon: Icons.arrow_forward_rounded,
          onPressed: () => context.go('/'),
        ),
        VelocityButton(
          label: linkVaultLocalizationsOf(context).alreadyMemberSignIn,
          filled: false,
          onPressed: () => context.go('/'),
        ),
      ],
    );
  }
}
