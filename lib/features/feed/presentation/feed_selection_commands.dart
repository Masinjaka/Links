import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/feed/presentation/widgets/archive_links_dialog.dart';
import 'package:linkvault/features/feed/presentation/widgets/delete_links_dialog.dart';
import 'package:linkvault/features/feed/presentation/widgets/delete_links_undo_snackbar_content.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class FeedSelectionCommands {
  const FeedSelectionCommands(this.context, this.ref);

  final BuildContext context;
  final WidgetRef ref;

  Future<void> archive() async {
    final ids = _ids;
    if (ids.isEmpty) return;
    if (!await showArchiveLinksDialog(context, ids.length)) return;
    await ref.read(feedRepositoryProvider).archiveLinks(ids);
    clearSelection();
  }

  Future<void> restore() async {
    await ref.read(feedRepositoryProvider).restoreLinks(_ids);
    clearSelection();
  }

  Future<void> favourite(bool value) async {
    await ref.read(feedRepositoryProvider).setFavourite(_ids, value);
  }

  Future<void> pin(bool value) async {
    await ref.read(feedRepositoryProvider).setPinned(_ids, value);
  }

  Future<void> deletePermanently() async {
    final ids = _ids;
    if (ids.isEmpty || !await showDeleteLinksDialog(context, ids.length)) {
      return;
    }
    final repository = ref.read(feedRepositoryProvider);
    await repository.trashLinks(ids);
    clearSelection();
    if (!context.mounted) {
      await repository.deletePermanently(ids);
      return;
    }
    final localizations = linkVaultLocalizationsOf(context);
    Future<void>? undo;
    final messenger = ScaffoldMessenger.of(context);
    final controller = messenger.showSnackBar(
      SnackBar(
        content: DeleteLinksUndoSnackbarContent(
          message: localizations.deletedLinks(ids.length),
          undoLabel: localizations.undo,
          onUndo: () {
            undo = repository.restoreLinks(ids);
            messenger.hideCurrentSnackBar(reason: SnackBarClosedReason.action);
          },
        ),
      ),
    );
    final reason = await controller.closed;
    if (reason == SnackBarClosedReason.action) {
      await undo;
      return;
    }
    await repository.deletePermanently(ids);
  }

  void clearSelection() {
    ref.read(selectedFeedLinkIdsProvider.notifier).clear();
  }

  Set<int> get _ids => ref.read(selectedFeedLinkIdsProvider);
}
