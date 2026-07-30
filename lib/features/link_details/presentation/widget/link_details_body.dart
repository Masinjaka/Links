part of 'link_details_widgets.dart';

class LinkDetailsBody extends ConsumerWidget {
  const LinkDetailsBody({
    super.key,
    required this.link,
    this.collectionId,
    this.sheetMode = false,
  });

  final LinkWithTags link;
  final int? collectionId;
  final bool sheetMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commands = LinkDetailsCommands(
      context: context,
      ref: ref,
      link: link,
      collectionId: collectionId,
      sheetMode: sheetMode,
    );
    final collections = ref.watch(feedCollectionsProvider).value ?? const [];
    var collectionName = ref
        .watch(linkDetailsCollectionProvider(link.link.id))
        .value
        ?.title;
    for (final collection in collections) {
      if (collection.id == collectionId) collectionName = collection.title;
    }

    final content = Column(
      children: [
        Expanded(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
            children: [
              LinkDetailsHeader(onClose: commands.navigateBack),
              const SizedBox(height: 24),
              LinkDetailsUrlPill(url: link.link.displayUrl),
              const SizedBox(height: 18),
              LinkDetailsSummaryCard(
                link: link,
                onAction: commands.handleMenuAction,
              ),
              const SizedBox(height: 22),
              LinkDetailsCollectionPill(collectionName: collectionName),
              const SizedBox(height: 22),
              PersonalNoteEditor(
                initialNote: link.link.note,
                onSave: commands.saveNote,
              ),
              const SizedBox(height: 18),
              LinkDetailsTagSection(tags: link.tags, onAdd: commands.edit),
            ],
          ),
        ),
        SafeArea(
          top: false,
          minimum: const EdgeInsets.fromLTRB(32, 12, 32, 18),
          child: LinkDetailsOpenButton(onPressed: commands.open),
        ),
      ],
    );

    if (sheetMode) {
      return Material(
        key: const Key('link-details-sheet-surface'),
        color: LinkVaultThemeTokens.background(context),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        clipBehavior: Clip.antiAlias,
        child: content,
      );
    }

    return Scaffold(
      backgroundColor: LinkVaultThemeTokens.background(context),
      body: SafeArea(bottom: false, child: content),
    );
  }
}
