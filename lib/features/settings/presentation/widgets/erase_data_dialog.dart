import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/shared/presentation/widgets/library_confirmation_dialog.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

Future<void> showEraseDataDialog(BuildContext context, WidgetRef ref) async {
  final confirmed = await showLibraryConfirmationDialog(
    context: context,
    title: linkVaultLocalizationsOf(context).eraseData,
    message: linkVaultLocalizationsOf(context).eraseDataMessage,
    primaryLabel: linkVaultLocalizationsOf(context).eraseData,
    primaryKey: const Key('confirm-erase-data'),
  );
  if (!confirmed) return;

  await ref.read(settingsRepositoryProvider).eraseAllData();
  ref.invalidate(addLinkOptimisticTagsProvider);
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(linkVaultLocalizationsOf(context).allDataErased)),
  );
}
