import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_confirmation_dialog.dart';

Future<bool> showDeleteLinksDialog(BuildContext context, int selectionCount) {
  final localizations = linkVaultLocalizationsOf(context);
  return showLibraryConfirmationDialog(
    context: context,
    title: localizations.deletePermanentlyQuestion,
    message: localizations.deleteLinksMessage(selectionCount),
    primaryLabel: localizations.delete,
    primaryKey: const Key('confirm-delete-links'),
  );
}
