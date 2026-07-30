import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/features/collections/presentation/show_add_collection_sheet.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_details_widgets.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_link_picker_sheet.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_menu_action.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/link_details/presentation/show_link_details_sheet.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class CollectionDetailsCommands {
  const CollectionDetailsCommands({
    required this.context,
    required this.ref,
    required this.collection,
    required this.sheetMode,
  });

  final BuildContext context;
  final WidgetRef ref;
  final CollectionWithCount collection;
  final bool sheetMode;

  int get id => collection.collection.id;

  void close() {
    if (sheetMode) {
      Navigator.of(context, rootNavigator: true).pop();
      return;
    }
    context.go('/collections');
  }

  Future<void> addLink() async {
    final linkIds = await showCollectionLinkPickerSheet(
      context: context,
      collectionId: id,
    );
    if (linkIds == null || linkIds.isEmpty) return;
    final repository = ref.read(collectionsRepositoryProvider);
    for (final linkId in linkIds) {
      await repository.addLink(id, linkId);
    }
  }

  void openLink(LinkWithTags link) {
    final rootContext = Navigator.of(context, rootNavigator: true).context;
    showLinkDetailsSheet(
      context: rootContext,
      linkId: link.link.id,
      collectionId: id,
    );
  }

  Future<void> toggleLinkFavourite(LinkWithTags link) {
    return ref.read(feedRepositoryProvider).setFavourite([
      link.link.id,
    ], !link.link.isFavourite);
  }

  Future<void> toggleLinkPin(LinkWithTags link) {
    return ref.read(feedRepositoryProvider).setPinned([
      link.link.id,
    ], !link.link.isPinned);
  }

  Future<void> handleOption(CollectionMenuAction action) async {
    final repository = ref.read(collectionsRepositoryProvider);
    switch (action) {
      case CollectionMenuAction.edit:
        _edit();
      case CollectionMenuAction.selectLinks:
        return;
      case CollectionMenuAction.favourite:
        await repository.setFavourite(id, !collection.collection.isFavourite);
      case CollectionMenuAction.pin:
        await repository.setPinned(id, !collection.collection.isPinned);
      case CollectionMenuAction.archive:
        final confirmed = await showArchiveCollectionDialog(
          context,
          collection.collection.title,
        );
        if (!confirmed) return;
        await repository.archive([id]);
        if (context.mounted) close();
      case CollectionMenuAction.delete:
        final confirmed = await _confirmDelete();
        if (!confirmed) return;
        await repository.delete(id);
        if (context.mounted) close();
    }
  }

  void _edit() {
    final navigator = Navigator.of(context, rootNavigator: true);
    final rootContext = navigator.context;
    if (sheetMode) navigator.pop();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!rootContext.mounted) return;
      showAddCollectionSheet(rootContext, collectionId: id);
    });
  }

  Future<bool> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final localizations = linkVaultLocalizationsOf(dialogContext);
        return AlertDialog(
          title: Text(localizations.deleteCollectionQuestion),
          content: Text(localizations.deleteCollectionMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(localizations.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(localizations.delete),
            ),
          ],
        );
      },
    );
    return confirmed == true;
  }
}
