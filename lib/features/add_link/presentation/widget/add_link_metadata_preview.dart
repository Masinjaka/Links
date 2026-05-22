part of 'add_link_widgets.dart';

class AddLinkMetadataPreview extends StatelessWidget {
  const AddLinkMetadataPreview({
    super.key,
    required this.preview,
    required this.rawUrl,
  });

  final AsyncValue<AddLinkMetadata?> preview;
  final String rawUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final surface = LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: LinkVaultThemeTokens.componentRadius,
        border: Border(
          top: BorderSide(color: ink),
          left: BorderSide(color: ink),
          right: BorderSide(color: ink, width: 4),
          bottom: BorderSide(color: ink, width: 4),
        ),
      ),
      child: Row(
        children: [
          _PreviewVisual(preview: preview),
          const SizedBox(width: 32),
          Expanded(
            child: preview.when(
              data: (metadata) => _PreviewResolvedContent(
                metadata: metadata,
                rawUrl: rawUrl,
                textTheme: textTheme,
              ),
              error: (error, stackTrace) =>
                  _PreviewErrorContent(rawUrl: rawUrl, textTheme: textTheme),
              loading: () => _PreviewLoadingContent(textTheme: textTheme),
            ),
          ),
        ],
      ),
    );
  }
}
