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

    return Container(
      key: const Key('add-link-metadata-card'),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PreviewVisual(preview: preview),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
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
