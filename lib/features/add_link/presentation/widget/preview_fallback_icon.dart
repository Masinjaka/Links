part of 'add_link_widgets.dart';

class _PreviewFallbackIcon extends StatelessWidget {
  const _PreviewFallbackIcon();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.public_rounded,
      color: LinkVaultColors.secondary,
      size: 44,
    );
  }
}
