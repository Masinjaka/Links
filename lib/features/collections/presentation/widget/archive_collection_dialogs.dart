part of 'collection_details_widgets.dart';

Future<bool> showArchiveCollectionDialog(
  BuildContext context,
  String collectionTitle,
) {
  final localizations = linkVaultLocalizationsOf(context);
  return showLibraryConfirmationDialog(
    context: context,
    title: localizations.archive,
    message: localizations.archiveCollectionMessage(
      collectionTitle.sentenceDisplayText,
    ),
    primaryLabel: localizations.archive,
    primaryKey: const Key('confirm-archive-collection'),
  );
}

Future<bool> showArchiveCollectionsDialog(
  BuildContext context,
  int selectionCount,
) {
  final localizations = linkVaultLocalizationsOf(context);
  return showLibraryConfirmationDialog(
    context: context,
    title: localizations.archive,
    message: localizations.archiveCollectionsMessage(selectionCount),
    primaryLabel: localizations.archive,
    primaryKey: const Key('confirm-archive-collections'),
  );
}
