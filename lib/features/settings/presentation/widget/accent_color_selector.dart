part of 'settings_widgets.dart';

class AccentColorSelector extends StatelessWidget {
  const AccentColorSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final AppAccentTone selected;
  final ValueChanged<AppAccentTone> onSelected;

  @override
  Widget build(BuildContext context) {
    final strings = linkVaultLocalizationsOf(context);
    final options = [
      (AppAccentTone.red, strings.red),
      (AppAccentTone.green, strings.green),
      (AppAccentTone.blue, strings.blue),
      (AppAccentTone.purple, strings.purple),
    ];

    return SegmentedSettingsControl<AppAccentTone>(
      selected: selected,
      options: options,
      onSelected: onSelected,
      selectedFillColor: (tone) => Color(tone.colorValue),
      selectedForegroundColor: (tone) {
        final color = Color(tone.colorValue);
        return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
            ? Colors.white
            : Colors.black;
      },
    );
  }
}
