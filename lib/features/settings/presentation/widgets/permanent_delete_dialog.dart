import 'package:flutter/material.dart';

import 'package:linkvault/shared/presentation/widgets/library_confirmation_dialog.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

Future<bool> confirmPermanentArchiveDeletion(BuildContext context, int count) {
  return showLibraryConfirmationDialog(
    context: context,
    title: linkVaultLocalizationsOf(context).delete,
    message: linkVaultLocalizationsOf(context).deleteItemsMessage(count),
    primaryLabel: linkVaultLocalizationsOf(context).delete,
    primaryKey: const Key('confirm-permanent-delete'),
  );
}
