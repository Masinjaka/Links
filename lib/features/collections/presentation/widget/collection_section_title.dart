part of 'add_collection_widgets.dart';

class CollectionSectionTitle extends StatelessWidget {
  const CollectionSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleSize = textTheme.labelLarge?.fontSize;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.displayText,
          style: textTheme.labelLarge?.copyWith(
            fontFamily: 'OpenSans',
            color: LinkVaultThemeTokens.ink(context),
            fontSize: titleSize,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
