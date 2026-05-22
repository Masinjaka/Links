part of 'add_link_widgets.dart';

class _PreviewLoadingContent extends StatelessWidget {
  const _PreviewLoadingContent({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FETCHING_METADATA...',
          style: textTheme.labelLarge?.copyWith(
            color: LinkVaultColors.secondary,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 12),
        const SkeletonBar(widthFactor: .94),
        const SizedBox(height: 12),
        const SkeletonBar(widthFactor: .56),
      ],
    );
  }
}
