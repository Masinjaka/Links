part of 'collections_widgets.dart';

class CollectionArchiveAction extends StatelessWidget {
  const CollectionArchiveAction({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Positioned(
      right: 32,
      bottom: bottomInset + 24,
      child: SquareButton(
        onPressed: onPressed,
        tooltip: 'Archive collections',
        icon: Icons.archive_outlined,
        shadowed: false,
      ),
    );
  }
}
