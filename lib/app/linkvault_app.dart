import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/app_router.dart';
import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';

class LinkVaultApp extends ConsumerWidget {
  const LinkVaultApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(seedDatabaseProvider);
    final themePreference = ref.watch(selectedAppThemePreferenceProvider);
    final accentTone = ref.watch(selectedAccentToneProvider);
    final accentColor = Color(accentTone.colorValue);
    LinkVaultColors.applyAccent(accentColor);

    return MaterialApp.router(
      title: 'LinkVault',
      debugShowCheckedModeBanner: false,
      theme: LinkVaultTheme.light(accentColor),
      darkTheme: LinkVaultTheme.dark(accentColor),
      themeMode: switch (themePreference) {
        AppThemePreference.system => ThemeMode.system,
        AppThemePreference.light => ThemeMode.light,
        AppThemePreference.dark => ThemeMode.dark,
      },
      routerConfig: appRouter,
    );
  }
}
