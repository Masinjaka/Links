import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_library_tabs.dart';
import 'package:linkvault/features/settings/presentation/widgets/permanent_delete_dialog.dart';

Future<void> restoreArchivedItems(
  WidgetRef ref,
  ArchivedLibraryTab tab,
  Set<int> ids,
) {
  if (tab == ArchivedLibraryTab.links) {
    return ref.read(feedRepositoryProvider).restoreLinks(ids);
  }
  return ref.read(collectionsRepositoryProvider).restore(ids);
}

Future<bool> deleteArchivedItems(
  BuildContext context,
  WidgetRef ref,
  ArchivedLibraryTab tab,
  Set<int> ids,
) async {
  if (!await confirmPermanentArchiveDeletion(context, ids.length)) {
    return false;
  }
  if (tab == ArchivedLibraryTab.links) {
    await ref.read(feedRepositoryProvider).deletePermanently(ids);
  } else {
    await ref.read(collectionsRepositoryProvider).deletePermanently(ids);
  }
  return true;
}
