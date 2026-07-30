import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_bottom_sheet.dart';

Future<void> showLibrarySortSheet<T>({
  required BuildContext context,
  required T selected,
  required List<(T, String)> options,
  required ValueChanged<T> onSelected,
}) async {
  final result = await showLibraryBottomSheet<T>(
    context: context,
    surfaceKey: const Key('sort-bottom-sheet'),
    handleSpacing: 18,
    builder: (_) => SortBottomSheet<T>(selected: selected, options: options),
  );
  if (result != null) onSelected(result);
}

class SortBottomSheet<T> extends StatelessWidget {
  const SortBottomSheet({
    super.key,
    required this.selected,
    required this.options,
  });

  final T selected;
  final List<(T, String)> options;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(32, 0, 32, 24 + bottomInset),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            linkVaultLocalizationsOf(context).sort,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          for (final (index, option) in options.indexed)
            _option(context, index, option),
        ],
      ),
    );
  }

  Widget _option(BuildContext context, int index, (T, String) option) {
    final isSelected = option.$1 == selected;
    return InkWell(
      key: Key('sort-option-$index'),
      onTap: () => Navigator.of(context).pop(option.$1),
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 43,
        child: Row(
          children: [
            SizedBox.square(
              dimension: 20,
              child: isSelected
                  ? DecoratedBox(
                      decoration: BoxDecoration(
                        color: LinkVaultColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        size: 16,
                        color: LinkVaultColors.onPrimary,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                option.$2,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
