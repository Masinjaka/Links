import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/settings/presentation/show_archived_library_sheet.dart';
import 'package:linkvault/features/settings/presentation/show_tags_library_sheet.dart';
import 'package:linkvault/features/settings/presentation/widgets/settings_list_row.dart';
import 'package:linkvault/features/settings/presentation/widgets/settings_section_card.dart';
import 'package:linkvault/features/settings/presentation/widgets/erase_data_dialog.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class SettingsLinksSection extends ConsumerWidget {
  const SettingsLinksSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = linkVaultLocalizationsOf(context);
    return SettingsSectionCard(
      title: localizations.links,
      children: [
        SettingsListRow(
          key: const Key('settings-export-row'),
          icon: Icons.save_as_outlined,
          label: localizations.exportLinksCsv,
          onTap: () => _export(context, ref),
        ),
        SettingsListRow(
          key: const Key('settings-archived-row'),
          icon: Icons.archive_outlined,
          label: localizations.archived,
          onTap: () => showArchivedLibrarySheet(context),
        ),
        SettingsListRow(
          key: const Key('settings-tags-row'),
          icon: Icons.sell_outlined,
          label: localizations.tags,
          onTap: () => showTagsLibrarySheet(context),
        ),
        SettingsListRow(
          key: const Key('settings-erase-data-row'),
          icon: Icons.cancel_outlined,
          label: localizations.eraseData,
          destructive: true,
          onTap: () => showEraseDataDialog(context, ref),
        ),
      ],
    );
  }

  Future<void> _export(BuildContext context, WidgetRef ref) async {
    final csv = await ref.read(settingsRepositoryProvider).exportLinksCsv();
    if (!context.mounted) return;
    await ref.read(csvFileSaverProvider).save(csv);
  }
}
