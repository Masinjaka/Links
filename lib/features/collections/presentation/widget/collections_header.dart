part of 'collections_widgets.dart';

class CollectionsHeader extends StatelessWidget {
  const CollectionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Collections',
              style: textTheme.titleLarge?.copyWith(
                color: LinkVaultThemeTokens.ink(context),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
