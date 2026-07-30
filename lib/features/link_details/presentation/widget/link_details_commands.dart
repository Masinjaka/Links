part of 'link_details_widgets.dart';

class LinkDetailsCommands {
  const LinkDetailsCommands({
    required this.context,
    required this.ref,
    required this.link,
    this.collectionId,
    this.sheetMode = false,
  });

  final BuildContext context;
  final WidgetRef ref;
  final LinkWithTags link;
  final int? collectionId;
  final bool sheetMode;

  void navigateBack() {
    if (sheetMode) {
      Navigator.of(context, rootNavigator: true).pop();
      return;
    }
    context.go(
      collectionId == null ? '/' : '/collections/view?id=$collectionId',
    );
  }

  void edit() {
    final navigator = Navigator.of(context, rootNavigator: true);
    final rootContext = navigator.context;
    if (sheetMode) navigator.pop();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!rootContext.mounted) return;
      showAddLinkSheet(
        rootContext,
        linkId: link.link.id,
        collectionId: collectionId,
      );
    });
  }

  Future<void> saveNote(String note) async {
    await ref.read(feedRepositoryProvider).updateNote(link.link.id, note);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(linkVaultLocalizationsOf(context).noteSaved)),
    );
  }

  Future<void> share() async {
    final box = context.findRenderObject() as RenderBox?;
    final uri = Uri.tryParse(link.link.displayUrl);
    final origin = box == null
        ? null
        : box.localToGlobal(Offset.zero) & box.size;
    await SharePlus.instance.share(
      uri != null && uri.hasScheme
          ? ShareParams(
              uri: uri,
              title: link.link.title,
              subject: link.link.title,
              sharePositionOrigin: origin,
            )
          : ShareParams(
              text: link.link.displayUrl,
              title: link.link.title,
              subject: link.link.title,
              sharePositionOrigin: origin,
            ),
    );
  }

  Future<void> open() async {
    final uri = Uri.tryParse(normalizeUrl(link.link.displayUrl));
    final launched =
        uri != null &&
        await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (launched || !context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(linkVaultLocalizationsOf(context).failedToOpenLink),
      ),
    );
  }

  Future<void> handleMenuAction(LinkMenuAction action) async {
    final repository = ref.read(feedRepositoryProvider);
    switch (action) {
      case LinkMenuAction.edit:
        edit();
      case LinkMenuAction.share:
        await share();
      case LinkMenuAction.favourite:
        await repository.setFavourite([link.link.id], !link.link.isFavourite);
      case LinkMenuAction.pin:
        await repository.setPinned([link.link.id], !link.link.isPinned);
      case LinkMenuAction.archive:
        await _archive();
      case LinkMenuAction.trash:
        await repository.trashLinks([link.link.id]);
        if (!context.mounted) return;
        navigateBack();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(linkVaultLocalizationsOf(context).linkMovedToTrash),
            action: SnackBarAction(
              label: linkVaultLocalizationsOf(context).undo,
              onPressed: () => repository.restoreLinks([link.link.id]),
            ),
          ),
        );
    }
  }

  Future<void> _archive() async {
    final confirmed = await showArchiveLinkDialog(context, link.link.title);
    if (!confirmed || !context.mounted) return;
    await ref.read(feedRepositoryProvider).archiveLinks([link.link.id]);
    if (!context.mounted) return;
    navigateBack();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(linkVaultLocalizationsOf(context).linkArchived)),
    );
  }
}
