part of 'settings_widgets.dart';

class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final AppThemePreference selected;
  final ValueChanged<AppThemePreference> onSelected;

  @override
  Widget build(BuildContext context) {
    final strings = linkVaultLocalizationsOf(context);
    final options = [
      (AppThemePreference.light, strings.light),
      (AppThemePreference.dark, strings.dark),
      (AppThemePreference.system, strings.system),
    ];

    return SegmentedSettingsControl<AppThemePreference>(
      selected: selected,
      options: options,
      onSelected: onSelected,
    );
  }
}
