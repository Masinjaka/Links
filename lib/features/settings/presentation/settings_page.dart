import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/settings/presentation/widgets/settings_links_section.dart';
import 'package:linkvault/features/settings/presentation/widgets/settings_preferences_section.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LinkVaultThemeTokens.background(context),
      child: SafeArea(
        bottom: false,
        child: ListView(
          key: const Key('settings-page'),
          padding: const EdgeInsets.fromLTRB(32, 31, 32, 132),
          children: [
            Text(
              linkVaultLocalizationsOf(context).settingsPageTitle,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 43),
            const SettingsPreferencesSection(),
            const SizedBox(height: 31),
            const SettingsLinksSection(),
          ],
        ),
      ),
    );
  }
}
