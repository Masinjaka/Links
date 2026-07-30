part of 'add_link_widgets.dart';

class _PreviewLoadingContent extends StatelessWidget {
  const _PreviewLoadingContent({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    final baseColor = colorScheme.onSurface.withValues(
      alpha: isDark ? .14 : .10,
    );
    final highlightColor = colorScheme.onSurface.withValues(
      alpha: isDark ? .30 : .04,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          linkVaultLocalizationsOf(context).metadataFetching,
          style: textTheme.labelLarge?.copyWith(
            color: LinkVaultColors.secondary,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 12),
        Shimmer.fromColors(
          key: const Key('add-link-metadata-shimmer'),
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonBar(widthFactor: .94),
              SizedBox(height: 12),
              SkeletonBar(widthFactor: .56),
            ],
          ),
        ),
      ],
    );
  }
}
