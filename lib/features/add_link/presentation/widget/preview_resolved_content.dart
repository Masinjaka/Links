part of 'add_link_widgets.dart';

class _PreviewResolvedContent extends StatelessWidget {
  const _PreviewResolvedContent({
    required this.metadata,
    required this.rawUrl,
    required this.textTheme,
  });

  final AddLinkMetadata? metadata;
  final String rawUrl;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final host = metadata?.host ?? Uri.tryParse(rawUrl)?.host ?? 'local';
    final title = metadata?.title ?? host;
    final description =
        metadata?.description ??
        linkVaultLocalizationsOf(context).pasteValidLink;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyMedium?.copyWith(
            color: LinkVaultThemeTokens.secondaryInk(context),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
