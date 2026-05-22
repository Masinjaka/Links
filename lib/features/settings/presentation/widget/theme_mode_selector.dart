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
    const options = [
      (AppThemePreference.light, 'LIGHT'),
      (AppThemePreference.dark, 'DARK'),
      (AppThemePreference.system, 'SYSTEM'),
    ];

    return SegmentedSettingsControl<AppThemePreference>(
      selected: selected,
      options: options,
      onSelected: onSelected,
    );
  }
}
