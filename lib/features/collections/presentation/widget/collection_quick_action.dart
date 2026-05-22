part of 'collections_widgets.dart';

class CollectionQuickAction extends StatelessWidget {
  const CollectionQuickAction({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Positioned(
      right: 32,
      bottom: bottomInset + 24,
      child: SquareButton(
        onPressed: onPressed,
        tooltip: 'Add collection',
        icon: Icons.add_rounded,
        shadowed: false,
      ),
    );
  }
}
