part of 'collections_widgets.dart';

class CollectionsHeader extends StatelessWidget {
  const CollectionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        linkVaultLocalizationsOf(context).collectionsPageTitle,
        style: textTheme.headlineLarge?.copyWith(
          fontFamily: 'Oswald',
          color: LinkVaultThemeTokens.ink(context),
          fontSize: 44,
          fontWeight: FontWeight.w700,
          height: 1,
          letterSpacing: .8,
        ),
      ),
    );
  }
}
