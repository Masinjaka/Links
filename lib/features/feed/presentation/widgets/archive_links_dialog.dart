import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_confirmation_dialog.dart';

Future<bool> showArchiveLinksDialog(BuildContext context, int selectionCount) {
  final localizations = linkVaultLocalizationsOf(context);
  return showLibraryConfirmationDialog(
    context: context,
    title: localizations.archive,
    message: localizations.archiveLinksMessage(selectionCount),
    primaryLabel: localizations.archive,
    primaryKey: const Key('confirm-archive-links'),
  );
}
