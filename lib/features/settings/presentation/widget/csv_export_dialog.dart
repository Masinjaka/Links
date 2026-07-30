import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/widgets/library_action_dialog.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

Future<void> showCsvExportDialog(BuildContext context, String csv) {
  return showLibraryActionDialog<void>(
    context: context,
    builder: (context) => LibraryActionDialog(
      height: 520,
      title: linkVaultLocalizationsOf(context).exportCsv,
      message: linkVaultLocalizationsOf(context).exportCsvMessage,
      secondaryLabel: linkVaultLocalizationsOf(context).cancel,
      primaryLabel: linkVaultLocalizationsOf(context).copyCsv,
      primaryKey: const Key('copy-exported-csv'),
      onSecondary: () => Navigator.of(context).pop(),
      onPrimary: () => _copyCsv(context, csv),
      body: Container(
        key: const Key('csv-export-content'),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: LinkVaultThemeTokens.surface(context),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: SelectableText(
            csv,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: LinkVaultThemeTokens.ink(context),
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> _copyCsv(BuildContext context, String csv) async {
  await Clipboard.setData(ClipboardData(text: csv));
  if (!context.mounted) return;
  Navigator.of(context).pop();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(linkVaultLocalizationsOf(context).csvCopied)),
  );
}
