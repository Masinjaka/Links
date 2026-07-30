import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/selection_action_rail.dart';

class ArchivedSelectionActions extends StatelessWidget {
  const ArchivedSelectionActions({
    super.key,
    required this.onRestore,
    required this.onDelete,
  });

  final VoidCallback onRestore;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    return SelectionActionRail(
      actions: [
        (localizations.restoreSelected, Icons.restore_rounded, onRestore),
        (
          localizations.deletePermanently,
          Icons.delete_forever_outlined,
          onDelete,
        ),
      ],
    );
  }
}
