import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/widgets/library_action_dialog.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

Future<String?> showCsvImportDialog(BuildContext context) {
  return showLibraryActionDialog<String>(
    context: context,
    builder: (_) => const _CsvImportSheet(),
  );
}

class _CsvImportSheet extends StatefulWidget {
  const _CsvImportSheet();

  @override
  State<_CsvImportSheet> createState() => _CsvImportSheetState();
}

class _CsvImportSheetState extends State<_CsvImportSheet> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LibraryActionDialog(
      height: 520,
      title: linkVaultLocalizationsOf(context).importCsv,
      message: linkVaultLocalizationsOf(context).importCsvMessage,
      secondaryLabel: linkVaultLocalizationsOf(context).cancel,
      primaryLabel: linkVaultLocalizationsOf(context).importCsv,
      primaryKey: const Key('confirm-csv-import'),
      onSecondary: () => Navigator.of(context).pop(),
      onPrimary: () => Navigator.of(context).pop(controller.text),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: LinkVaultThemeTokens.surface(context),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          key: const Key('csv-import-field'),
          controller: controller,
          maxLines: null,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
          decoration: const InputDecoration(
            hintText: 'url,title,description,tags,is_archived',
          ),
        ),
      ),
    );
  }
}
