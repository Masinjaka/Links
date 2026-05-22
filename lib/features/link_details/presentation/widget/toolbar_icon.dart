part of 'link_details_widgets.dart';

class ToolbarIcon extends StatelessWidget {
  const ToolbarIcon({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashRadius: 22,
      icon: Icon(icon, color: LinkVaultColors.primary, size: 34),
    );
  }
}
