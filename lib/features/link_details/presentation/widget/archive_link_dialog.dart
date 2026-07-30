part of 'link_details_widgets.dart';

Future<bool> showArchiveLinkDialog(BuildContext context, String linkTitle) {
  return showLibraryConfirmationDialog(
    context: context,
    title: linkVaultLocalizationsOf(context).archive,
    message: linkVaultLocalizationsOf(
      context,
    ).archiveLinkMessage(linkTitle.sentenceDisplayText),
    primaryLabel: linkVaultLocalizationsOf(context).archive,
    primaryKey: const Key('confirm-archive-link'),
  );
}
