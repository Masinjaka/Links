import 'package:flutter/material.dart';

import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_circle_button.dart';
import 'package:linkvault/shared/presentation/widgets/sort_bottom_sheet.dart';

class CollectionSortButton extends StatelessWidget {
  const CollectionSortButton({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final CollectionSort selected;
  final ValueChanged<CollectionSort> onSelected;

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    return LibraryCircleButton(
      icon: Icons.sort_rounded,
      tooltip: localizations.sortCollections,
      onPressed: () {
        showLibrarySortSheet(
          context: context,
          selected: selected,
          options: [
            for (final value in CollectionSort.values)
              (value, _label(localizations, value)),
          ],
          onSelected: onSelected,
        );
      },
    );
  }

  String _label(AppLocalizations localizations, CollectionSort value) {
    return switch (value) {
      CollectionSort.recentlyCreated => localizations.recentlyCreated,
      CollectionSort.alphabetical => localizations.alphabetical,
      CollectionSort.linkCount => localizations.linkCountSort,
    };
  }
}
