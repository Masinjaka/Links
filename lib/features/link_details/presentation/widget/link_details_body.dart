part of 'link_details_widgets.dart';

class LinkDetailsBody extends ConsumerWidget {
  const LinkDetailsBody({super.key, required this.link, this.collectionId});

  final LinkWithTags link;
  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final titleSize = textTheme.labelLarge?.fontSize;
    final readingTime = link.link.readingTime.trim();
    final surface = LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);

    final previewImageUrl = link.preview?.imageUrl ?? link.link.sourceImageUrl;

    return Scaffold(
      backgroundColor: LinkVaultThemeTokens.background(context),
      body: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(child: VelocityKineticBackground()),
          ),
          ListView(
            padding: const EdgeInsets.only(bottom: 72),
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SquareButton(
                      onPressed: () => _navigateBack(context),
                      backgroundColor: surface,
                      icon: Icons.arrow_back_ios_new_rounded,
                      iconColor: LinkVaultColors.primary,
                      shadowed: false,
                      tooltip: 'CLOSE',
                      size: 45,
                      borderColor: LinkVaultColors.ink,
                    ),
                    Row(
                      children: [
                        SquareButton(
                          onPressed: () => _shareLink(context),
                          icon: Icons.share_outlined,
                          iconColor: LinkVaultColors.primary,
                          backgroundColor: surface,
                          borderColor: LinkVaultColors.ink,
                          size: 45,
                          shadowed: false,
                        ),
                        const SizedBox(width: 12),
                        SquareButton(
                          onPressed: () => _archiveLink(context, ref),
                          tooltip: 'ARCHIVE',
                          icon: Icons.archive_outlined,
                          size: 45,
                          shadowed: false,
                          iconColor: LinkVaultColors.primary,
                          backgroundColor: surface,
                          borderColor: LinkVaultColors.ink,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    VelocityPanel(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      backgroundColor: surface,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          previewImageUrl != null && previewImageUrl.isNotEmpty
                              ? PreviewPanel(link: link)
                              : SizedBox.shrink(),
                          SizedBox(
                            height:
                                previewImageUrl != null &&
                                    previewImageUrl.isNotEmpty
                                ? 15
                                : 0,
                          ),
                          Text(
                            link.link.title.toUpperCase().displayText,
                            textAlign: TextAlign.left,
                            style: textTheme.headlineMedium?.copyWith(
                              color: ink,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: surface,
                                  borderRadius:
                                      LinkVaultThemeTokens.componentRadius,
                                ),
                                child: Icon(Icons.language_rounded, color: ink),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  link.link.url,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: ink,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AUTO_SUMMARY'.displayText,
                          style: GoogleFonts.openSans(
                            textStyle: textTheme.labelLarge,
                            color: ink,
                            fontSize: titleSize,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    VelocityPanel(
                      padding: const EdgeInsets.all(20),
                      borderColor: LinkVaultColors.ink,
                      backgroundColor: surface,
                      child: Text(
                        link.link.description,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          height: 1.65,
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                    Text(
                      'METADATA_TAGS'.displayText,
                      style: textTheme.headlineMedium?.copyWith(
                        color: LinkVaultColors.secondary,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      children: [
                        for (final tag in link.tags)
                          VelocityChip(
                            label: tag.name,
                            icon: Icons.tag_rounded,
                          ),
                        VelocityChip(
                          label: 'ADDED_${link.savedDate}',
                          icon: Icons.history_rounded,
                        ),
                        if (readingTime.isNotEmpty)
                          VelocityChip(
                            label: readingTime,
                            icon: Icons.schedule_rounded,
                          ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: VelocityButton(
                            label: 'OPEN_LINK',
                            icon: Icons.open_in_new_rounded,
                            onPressed: () => _openLink(context),
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: VelocityButton(
                            label: 'EDIT_LINK',
                            icon: Icons.edit_note_rounded,
                            filled: false,
                            onPressed: () => context.go(
                              collectionId == null
                                  ? '/add?id=${link.link.id}'
                                  : '/add?id=${link.link.id}&collectionId=$collectionId',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateBack(BuildContext context) {
    if (collectionId != null) {
      context.go('/collections/view?id=$collectionId');
      return;
    }

    context.go('/');
  }

  Future<void> _shareLink(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    final shareUri = Uri.tryParse(link.link.url);
    await SharePlus.instance.share(
      shareUri != null && shareUri.hasScheme
          ? ShareParams(
              uri: shareUri,
              title: link.link.title,
              subject: link.link.title,
              sharePositionOrigin: box == null
                  ? null
                  : box.localToGlobal(Offset.zero) & box.size,
            )
          : ShareParams(
              text: link.link.url,
              title: link.link.title,
              subject: link.link.title,
              sharePositionOrigin: box == null
                  ? null
                  : box.localToGlobal(Offset.zero) & box.size,
            ),
    );
  }

  Future<void> _openLink(BuildContext context) async {
    final uri = Uri.tryParse(normalizeUrl(link.link.url));
    if (uri == null) {
      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('INVALID_LINK_URL'.displayText)));
      return;
    }

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (launched || !context.mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('FAILED_TO_OPEN_LINK'.displayText)));
  }

  Future<void> _archiveLink(BuildContext context, WidgetRef ref) async {
    final confirmed = await showArchiveLinkDialog(context, link.link.title);

    if (confirmed != true || !context.mounted) {
      return;
    }

    await ref.read(linkDetailsRepositoryProvider).archive(link.link.id);
    if (!context.mounted) {
      return;
    }

    if (collectionId != null) {
      context.go('/collections/view?id=$collectionId');
    } else {
      context.go('/');
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('LINK_ARCHIVED'.displayText)));
  }
}
