import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/profile/presentation/widget/profile_widgets.dart';
import 'package:linkvault/features/profile/provider/profile_providers.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final profile = ref.watch(profileProvider);

    return profile.when(
      data: (snapshot) => ProfileBody(snapshot: snapshot),
      error: (error, stackTrace) => Scaffold(
        backgroundColor: LinkVaultThemeTokens.background(context),
        body: Stack(
          children: [
            const Positioned.fill(
              child: IgnorePointer(child: VelocityKineticBackground()),
            ),
            Center(
              child: Text(
                linkVaultLocalizationsOf(context).databaseError,
                style: textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
      loading: () => Scaffold(
        backgroundColor: LinkVaultThemeTokens.background(context),
        body: Stack(
          children: [
            Positioned.fill(
              child: IgnorePointer(child: VelocityKineticBackground()),
            ),
            Center(
              child: CircularProgressIndicator(color: LinkVaultColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
