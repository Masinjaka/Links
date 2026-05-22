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
    final title = metadata?.title ?? host.toUpperCase();
    final description =
        metadata?.description ?? 'Paste a valid link to fetch metadata.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          host.toUpperCase(),
          style: textTheme.labelLarge?.copyWith(
            color: LinkVaultColors.secondary,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleMedium?.copyWith(fontSize: 17),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyMedium?.copyWith(
            color: LinkVaultColors.secondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
