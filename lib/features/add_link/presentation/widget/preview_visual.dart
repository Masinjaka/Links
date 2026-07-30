part of 'add_link_widgets.dart';

class _PreviewVisual extends StatelessWidget {
  const _PreviewVisual({required this.preview});

  final AsyncValue<AddLinkMetadata?> preview;

  @override
  Widget build(BuildContext context) {
    final metadata = switch (preview) {
      AsyncData(:final value) => value,
      _ => null,
    };
    final previewImageUrl = metadata?.imageUrl;
    final iconUrl = metadata?.siteIconUrl;

    return Container(
      key: const Key('add-link-metadata-image'),
      width: double.infinity,
      height: 145,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: LinkVaultThemeTokens.surface(context)),
      child: previewImageUrl != null && previewImageUrl.isNotEmpty
          ? Image.network(
              previewImageUrl,
              key: const Key('add-link-metadata-preview-image'),
              width: double.infinity,
              height: 145,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => _siteIcon(iconUrl),
            )
          : _siteIcon(iconUrl),
    );
  }

  Widget _siteIcon(String? iconUrl) {
    if (iconUrl == null || iconUrl.isEmpty) {
      return const _PreviewFallbackIcon();
    }

    return Center(
      child: SizedBox(
        width: 48,
        height: 48,
        child: Image.network(
          iconUrl,
          width: 48,
          height: 48,
          fit: BoxFit.contain,
          alignment: Alignment.center,
          filterQuality: FilterQuality.none,
          errorBuilder: (_, _, _) => const _PreviewFallbackIcon(),
        ),
      ),
    );
  }
}
