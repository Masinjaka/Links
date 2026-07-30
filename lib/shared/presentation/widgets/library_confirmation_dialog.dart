import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_action_dialog.dart';

Future<bool> showLibraryConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String primaryLabel,
  String? secondaryLabel,
  Key? primaryKey,
}) async {
  final result = await showLibraryActionDialog<bool>(
    context: context,
    builder: (context) => LibraryActionDialog(
      title: title,
      message: message,
      secondaryLabel:
          secondaryLabel ?? linkVaultLocalizationsOf(context).cancel,
      primaryLabel: primaryLabel,
      primaryKey: primaryKey,
      onSecondary: () => Navigator.of(context).pop(false),
      onPrimary: () => Navigator.of(context).pop(true),
    ),
  );
  return result ?? false;
}
