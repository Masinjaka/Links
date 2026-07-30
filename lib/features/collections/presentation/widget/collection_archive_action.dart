part of 'collections_widgets.dart';

class CollectionArchiveAction extends StatelessWidget {
  const CollectionArchiveAction({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SelectionActionRail(
      actions: [
        (
          linkVaultLocalizationsOf(context).archive,
          Icons.archive_outlined,
          onPressed,
        ),
      ],
    );
  }
}
