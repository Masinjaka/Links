part of 'add_collection_widgets.dart';

class CollectionSectionTitle extends StatelessWidget {
  const CollectionSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        Container(width: 120, height: 4, color: LinkVaultColors.primary),
      ],
    );
  }
}
