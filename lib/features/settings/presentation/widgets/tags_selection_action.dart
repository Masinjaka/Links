import 'package:flutter/material.dart';

import 'package:linkvault/shared/presentation/widgets/selection_action_rail.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class TagsSelectionAction extends StatelessWidget {
  const TagsSelectionAction({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return SelectionActionRail(
      actions: [
        (
          linkVaultLocalizationsOf(context).deleteSelectedTags,
          Icons.delete_outline,
          onDelete,
        ),
      ],
    );
  }
}
