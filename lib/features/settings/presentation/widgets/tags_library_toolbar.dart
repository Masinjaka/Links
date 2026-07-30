import 'package:flutter/material.dart';

import 'package:linkvault/features/feed/presentation/widgets/feed_search_strip.dart';
import 'package:linkvault/shared/presentation/widgets/library_circle_button.dart';
import 'package:linkvault/shared/presentation/widgets/select_all_strip.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class TagsLibraryToolbar extends StatelessWidget {
  const TagsLibraryToolbar({
    super.key,
    required this.selectionMode,
    required this.allSelected,
    required this.onSearchChanged,
    required this.onSelectAll,
    required this.onCancelSelection,
    required this.onStartSelection,
  });

  final bool selectionMode;
  final bool allSelected;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSelectAll;
  final VoidCallback onCancelSelection;
  final VoidCallback onStartSelection;

  @override
  Widget build(BuildContext context) {
    if (selectionMode) {
      return SelectAllStrip(
        selected: allSelected,
        onTap: onSelectAll,
        onCancel: onCancelSelection,
      );
    }
    return Row(
      children: [
        Expanded(child: FeedSearchStrip(onChanged: onSearchChanged)),
        const SizedBox(width: 8),
        LibraryCircleButton(
          key: const Key('tags-start-selection'),
          icon: Icons.checklist_rounded,
          tooltip: linkVaultLocalizationsOf(context).selectMultipleTags,
          onPressed: onStartSelection,
        ),
      ],
    );
  }
}
