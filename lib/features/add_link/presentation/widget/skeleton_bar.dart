part of 'add_link_widgets.dart';

class SkeletonBar extends StatelessWidget {
  const SkeletonBar({super.key, required this.widthFactor});

  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      alignment: Alignment.centerLeft,
      child: Container(height: 22, color: LinkVaultColors.primary),
    );
  }
}
