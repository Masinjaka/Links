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
    final iconUrl = metadata?.siteIconUrl;

    return Container(
      width: 96,
      height: 96,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(color: LinkVaultColors.primary),
        color: LinkVaultThemeTokens.surface(context),
        borderRadius: LinkVaultThemeTokens.componentRadius,
      ),
      child: iconUrl != null && iconUrl.isNotEmpty
          ? Center(
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
                  errorBuilder: (context, error, stackTrace) {
                    return const _PreviewFallbackIcon();
                  },
                ),
              ),
            )
          : const _PreviewFallbackIcon(),
    );
  }
}
