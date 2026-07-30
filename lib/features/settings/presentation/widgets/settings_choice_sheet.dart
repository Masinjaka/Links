import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_bottom_sheet.dart';

Future<void> showSettingsChoiceSheet<T>({
  required BuildContext context,
  required String title,
  required T selected,
  required List<(T, String, Color?)> options,
  required ValueChanged<T> onSelected,
}) {
  final height = options.length > 3 ? 300.0 : 256.0;
  return showLibraryBottomSheet<void>(
    context: context,
    surfaceKey: const Key('settings-choice-sheet'),
    height: height,
    handleSpacing: 19,
    builder: (_) => SettingsChoiceSheet<T>(
      title: title,
      selected: selected,
      options: options,
      onSelected: onSelected,
    ),
  );
}

class SettingsChoiceSheet<T> extends StatefulWidget {
  const SettingsChoiceSheet({
    super.key,
    required this.title,
    required this.selected,
    required this.options,
    required this.onSelected,
  });

  final String title;
  final T selected;
  final List<(T, String, Color?)> options;
  final ValueChanged<T> onSelected;

  @override
  State<SettingsChoiceSheet<T>> createState() => _SettingsChoiceSheetState<T>();
}

class _SettingsChoiceSheetState<T> extends State<SettingsChoiceSheet<T>> {
  late T selected = widget.selected;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(32, 0, 32, bottomPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              TextButton(
                key: const Key('settings-choice-done'),
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  foregroundColor: LinkVaultThemeTokens.primary(context),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(38, 36),
                ),
                child: Text(linkVaultLocalizationsOf(context).done),
              ),
            ],
          ),
          const SizedBox(height: 8),
          for (final (index, option) in widget.options.indexed)
            _ChoiceRow<T>(
              index: index,
              option: option,
              selected: option.$1 == selected,
              onTap: () => _select(option.$1),
            ),
        ],
      ),
    );
  }

  void _select(T value) {
    setState(() => selected = value);
    widget.onSelected(value);
  }
}

class _ChoiceRow<T> extends StatelessWidget {
  const _ChoiceRow({
    required this.index,
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final int index;
  final (T, String, Color?) option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final swatch = option.$3;
    return InkWell(
      key: Key('settings-choice-option-$index'),
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 43,
        child: Row(
          children: [
            SizedBox.square(
              dimension: 20,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: selected
                      ? LinkVaultThemeTokens.primary(context)
                      : swatch ?? Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: selected
                    ? const Icon(
                        Icons.check_rounded,
                        size: 15,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              option.$2,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: selected ? FontWeight.w800 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
