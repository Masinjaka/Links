import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/feed/presentation/widgets/archive_links_dialog.dart';
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

  Future<void> trash() async {
    final ids = _ids;
    if (ids.isEmpty) return;
    await ref.read(feedRepositoryProvider).trashLinks(ids);
    clearSelection();
    if (!context.mounted) return;
    final localizations = linkVaultLocalizationsOf(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(localizations.trashedLinks(ids.length)),
        action: SnackBarAction(
          label: localizations.undo,
          onPressed: () {
            ref.read(feedRepositoryProvider).restoreLinks(ids);
          },
        ),
      ),
    );
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
    if (ids.isEmpty || !await _confirmPermanentDelete(ids.length)) return;
    await ref.read(feedRepositoryProvider).deletePermanently(ids);
    clearSelection();
  }

  void clearSelection() {
    ref.read(selectedFeedLinkIdsProvider.notifier).clear();
  }

  Set<int> get _ids => ref.read(selectedFeedLinkIdsProvider);

  Future<bool> _confirmPermanentDelete(int count) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            final localizations = linkVaultLocalizationsOf(context);
            return AlertDialog(
              title: Text(localizations.deletePermanentlyQuestion),
              content: Text(localizations.linksCannotRestore(count)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(localizations.cancel),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(localizations.delete),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
