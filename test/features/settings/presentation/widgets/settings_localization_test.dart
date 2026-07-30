import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/settings/presentation/widgets/settings_preferences_section.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/l10n/app_localizations.dart';

void main() {
  testWidgets('settings preferences render in the selected locale', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          selectedAppThemePreferenceProvider.overrideWithValue(
            AppThemePreference.light,
          ),
          selectedAccentToneProvider.overrideWithValue(AppAccentTone.red),
          selectedAppLanguageProvider.overrideWithValue(AppLanguage.french),
        ],
        child: MaterialApp(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: SettingsPreferencesSection()),
        ),
      ),
    );

    expect(find.text('Préférences'), findsOneWidget);
    expect(find.text('Thème'), findsOneWidget);
    expect(find.text('Couleur d’accent'), findsOneWidget);
    expect(find.text('Langue'), findsOneWidget);
    expect(find.text('Français'), findsOneWidget);
  });
}
