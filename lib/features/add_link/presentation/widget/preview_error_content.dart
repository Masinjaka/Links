part of 'add_link_widgets.dart';

class _PreviewErrorContent extends StatelessWidget {
  const _PreviewErrorContent({required this.rawUrl, required this.textTheme});

  final String rawUrl;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final host = Uri.tryParse(rawUrl)?.host;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          (host == null || host.isEmpty ? 'LINK_INPUT' : host).toUpperCase(),
          style: textTheme.labelLarge?.copyWith(
            color: LinkVaultColors.secondary,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'METADATA_UNAVAILABLE',
          style: textTheme.titleMedium?.copyWith(fontSize: 17),
        ),
        const SizedBox(height: 10),
        Text(
          'The link can still be saved. Metadata will be fetched again on save.',
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
