import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/settings/presentation/widget/settings_widgets.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePreference = ref.watch(selectedAppThemePreferenceProvider);
    final accentTone = ref.watch(selectedAccentToneProvider);
    final version = ref.watch(installedAppVersionProvider);

    return VelocityPage(
      bottomInset: 64,
      children: [
        SettingsHeader(onClose: () => context.go('/')),
        Padding(
          padding: const EdgeInsets.only(top: 17),
          child: SettingsSection(
            title: 'APPEARANCE',
            children: [
              SettingsOptionRow(
                title: 'THEME',
                control: ThemeModeSelector(
                  selected: themePreference,
                  onSelected: (value) {
                    ref
                        .read(selectedAppThemePreferenceProvider.notifier)
                        .select(value);
                  },
                ),
              ),
              SettingsOptionRow(
                title: 'ACCENT_COLOR',
                control: AccentColorSelector(
                  selected: accentTone,
                  onSelected: (value) {
                    ref.read(selectedAccentToneProvider.notifier).select(value);
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 17),
          child: SettingsSection(
            title: 'IMPORT_EXPORT',
            children: [
              SettingsOptionRow(
                title: 'EXPORT_CSV',
                control: CsvActionButton(
                  label: 'EXPORT',
                  onPressed: () => _exportCsv(context, ref),
                ),
              ),
              SettingsOptionRow(
                title: 'IMPORT_CSV',
                control: CsvActionButton(
                  label: 'IMPORT',
                  onPressed: () => _importCsv(context, ref),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: version.when(
            data: (value) => Text(
              'VERSION_$value',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: LinkVaultColors.secondary,
              ),
            ),
            error: (_, _) => Text(
              'VERSION_UNAVAILABLE',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: LinkVaultColors.secondary,
              ),
            ),
            loading: () => Text(
              'LOADING_VERSION...',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: LinkVaultColors.secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Future<void> _exportCsv(BuildContext context, WidgetRef ref) async {
    final csv = await ref.read(settingsRepositoryProvider).exportLinksCsv();
    if (!context.mounted) {
      return;
    }

    await showCsvExportDialog(context, csv);
  }

  static Future<void> _importCsv(BuildContext context, WidgetRef ref) async {
    final csv = await showCsvImportDialog(context);
    if (csv == null || csv.trim().isEmpty) {
      return;
    }

    final imported = await ref
        .read(settingsRepositoryProvider)
        .importLinksCsv(csv);
    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          imported == 0 ? 'NO_LINKS_IMPORTED' : 'IMPORTED_${imported}_LINKS',
        ),
      ),
    );
  }
}

Future<void> showCsvExportDialog(BuildContext context, String csv) async {
  await showDialog<void>(
    context: context,
    builder: (context) {
      final ink = LinkVaultThemeTokens.ink(context);
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: LinkVaultThemeTokens.surface(context),
            border: Border.all(color: ink),
            borderRadius: LinkVaultThemeTokens.componentRadius,
            boxShadow: const [
              BoxShadow(
                color: LinkVaultColors.ink,
                offset: Offset(6, 6),
                blurRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'EXPORT_CSV',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Review the generated CSV and copy it out.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Container(
                height: 260,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: ink),
                  borderRadius: LinkVaultThemeTokens.componentRadius,
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    csv,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: ink),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: VelocityButton(
                      label: 'CLOSE',
                      filled: false,
                      borderColor: ink,
                      foregroundColor: ink,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: VelocityButton(
                      label: 'COPY_CSV',
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: csv));
                        if (!context.mounted) {
                          return;
                        }
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('CSV_COPIED')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<String?> showCsvImportDialog(BuildContext context) async {
  final controller = TextEditingController();

  final result = await showDialog<String>(
    context: context,
    builder: (context) {
      final ink = LinkVaultThemeTokens.ink(context);
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: LinkVaultThemeTokens.surface(context),
            border: Border.all(color: ink),
            borderRadius: LinkVaultThemeTokens.componentRadius,
            boxShadow: const [
              BoxShadow(
                color: LinkVaultColors.ink,
                offset: Offset(6, 6),
                blurRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'IMPORT_CSV',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Paste CSV content with at least a "url" column.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Container(
                height: 260,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: ink),
                  borderRadius: LinkVaultThemeTokens.componentRadius,
                ),
                child: TextField(
                  controller: controller,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    hintText: 'url,title,description,tags,is_archived',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: VelocityButton(
                      label: 'CANCEL',
                      filled: false,
                      borderColor: ink,
                      foregroundColor: ink,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: VelocityButton(
                      label: 'IMPORT',
                      onPressed: () =>
                          Navigator.of(context).pop(controller.text),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  controller.dispose();
  return result;
}
