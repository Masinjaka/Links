import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/settings/presentation/widgets/settings_choice_sheet.dart';
import 'package:linkvault/features/settings/presentation/widgets/settings_list_row.dart';
import 'package:linkvault/features/settings/presentation/widgets/settings_section_card.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class SettingsPreferencesSection extends ConsumerWidget {
  const SettingsPreferencesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(selectedAppThemePreferenceProvider);
    final accent = ref.watch(selectedAccentToneProvider);
    final language = ref.watch(selectedAppLanguageProvider);
    final localizations = linkVaultLocalizationsOf(context);
    return SettingsSectionCard(
      title: localizations.preferences,
      children: [
        SettingsListRow(
          key: const Key('settings-theme-row'),
          icon: Icons.contrast_rounded,
          label: localizations.theme,
          value: _themeLabel(localizations, theme),
          onTap: () => _showTheme(context, ref, theme),
        ),
        SettingsListRow(
          key: const Key('settings-accent-row'),
          icon: Icons.palette_outlined,
          label: localizations.accentColor,
          value: _accentLabel(localizations, accent),
          onTap: () => _showAccent(context, ref, accent),
        ),
        SettingsListRow(
          key: const Key('settings-language-row'),
          icon: Icons.translate_rounded,
          label: localizations.language,
          value: _languageLabel(localizations, language),
          onTap: () => _showLanguage(context, ref, language),
        ),
      ],
    );
  }

  void _showTheme(
    BuildContext context,
    WidgetRef ref,
    AppThemePreference selected,
  ) {
    final localizations = linkVaultLocalizationsOf(context);
    showSettingsChoiceSheet(
      context: context,
      title: localizations.theme,
      selected: selected,
      options: [
        for (final value in const [
          AppThemePreference.light,
          AppThemePreference.dark,
          AppThemePreference.system,
        ])
          (value, _themeLabel(localizations, value), null),
      ],
      onSelected: ref.read(selectedAppThemePreferenceProvider.notifier).select,
    );
  }

  void _showAccent(
    BuildContext context,
    WidgetRef ref,
    AppAccentTone selected,
  ) {
    final localizations = linkVaultLocalizationsOf(context);
    showSettingsChoiceSheet(
      context: context,
      title: localizations.accentColor,
      selected: selected,
      options: [
        for (final value in AppAccentTone.values)
          (value, _accentLabel(localizations, value), Color(value.colorValue)),
      ],
      onSelected: ref.read(selectedAccentToneProvider.notifier).select,
    );
  }

  void _showLanguage(
    BuildContext context,
    WidgetRef ref,
    AppLanguage selected,
  ) {
    final localizations = linkVaultLocalizationsOf(context);
    showSettingsChoiceSheet(
      context: context,
      title: localizations.language,
      selected: selected,
      options: [
        for (final value in AppLanguage.values)
          (value, _languageLabel(localizations, value), null),
      ],
      onSelected: ref.read(selectedAppLanguageProvider.notifier).select,
    );
  }

  String _themeLabel(
    AppLocalizations localizations,
    AppThemePreference value,
  ) => switch (value) {
    AppThemePreference.light => localizations.light,
    AppThemePreference.dark => localizations.dark,
    AppThemePreference.system => localizations.system,
  };

  String _accentLabel(AppLocalizations localizations, AppAccentTone value) =>
      switch (value) {
        AppAccentTone.red => localizations.red,
        AppAccentTone.green => localizations.green,
        AppAccentTone.blue => localizations.blue,
        AppAccentTone.purple => localizations.purple,
      };

  String _languageLabel(AppLocalizations localizations, AppLanguage value) =>
      switch (value) {
        AppLanguage.malagasy => localizations.malagasy,
        AppLanguage.french => localizations.french,
        AppLanguage.english => localizations.english,
      };
}
