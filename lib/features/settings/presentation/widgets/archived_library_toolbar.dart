import 'package:flutter/material.dart';

import 'package:linkvault/features/feed/presentation/widgets/feed_filter_rail.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_search_strip.dart';
import 'package:linkvault/shared/presentation/widgets/library_circle_button.dart';
import 'package:linkvault/shared/presentation/widgets/select_all_strip.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class ArchivedLibraryToolbar extends StatelessWidget {
  const ArchivedLibraryToolbar({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onFilterSelected,
    required this.onSearchChanged,
    required this.sortButton,
    required this.selectionMode,
    required this.allSelected,
    required this.onSelectAll,
    required this.onCancelSelection,
    required this.onStartSelection,
  });

  final List<String> filters;
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;
  final ValueChanged<String> onSearchChanged;
  final Widget sortButton;
  final bool selectionMode;
  final bool allSelected;
  final VoidCallback onSelectAll;
  final VoidCallback onCancelSelection;
  final VoidCallback onStartSelection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        selectionMode
            ? SelectAllStrip(
                selected: allSelected,
                onTap: onSelectAll,
                onCancel: onCancelSelection,
              )
            : Row(
                children: [
                  Expanded(child: FeedSearchStrip(onChanged: onSearchChanged)),
                  const SizedBox(width: 8),
                  sortButton,
                  const SizedBox(width: 8),
                  LibraryCircleButton(
                    icon: Icons.checklist_rounded,
                    tooltip: linkVaultLocalizationsOf(context).selectMultiple,
                    onPressed: onStartSelection,
                  ),
                ],
              ),
        const SizedBox(height: 27),
        FeedFilterRail(
          filters: filters,
          selectedFilter: selectedFilter,
          onSelected: onFilterSelected,
        ),
      ],
    );
  }
}
