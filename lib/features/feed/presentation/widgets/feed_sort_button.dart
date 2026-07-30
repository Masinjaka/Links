import 'package:flutter/material.dart';

import 'package:linkvault/features/feed/domain/bookmark_state.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_circle_button.dart';
import 'package:linkvault/shared/presentation/widgets/sort_bottom_sheet.dart';

class FeedSortButton extends StatelessWidget {
  const FeedSortButton({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final FeedSort selected;
  final ValueChanged<FeedSort> onSelected;

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    return LibraryCircleButton(
      icon: Icons.sort_rounded,
      tooltip: localizations.sortLinks,
      onPressed: () {
        showLibrarySortSheet(
          context: context,
          selected: selected,
          options: [
            for (final value in FeedSort.values)
              (value, _label(localizations, value)),
          ],
          onSelected: onSelected,
        );
      },
    );
  }

  String _label(AppLocalizations localizations, FeedSort value) {
    return switch (value) {
      FeedSort.recentlyAdded => localizations.recentlyAdded,
      FeedSort.oldest => localizations.oldest,
      FeedSort.recentlyUpdated => localizations.recentlyUpdated,
      FeedSort.recentlyOpened => localizations.recentlyOpened,
      FeedSort.alphabetical => localizations.alphabetical,
      FeedSort.domain => localizations.domain,
      FeedSort.manual => localizations.manualOrder,
    };
  }
}
