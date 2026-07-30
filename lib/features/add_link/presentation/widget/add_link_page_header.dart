part of 'add_link_widgets.dart';

class AddLinkPageHeader extends StatelessWidget {
  const AddLinkPageHeader({
    super.key,
    required this.onBack,
    required this.title,
  });

  final VoidCallback onBack;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: LinkVaultThemeTokens.ink(context),
            fontFamily: 'Oswald',
            fontSize: 34,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          onPressed: onBack,
          tooltip: linkVaultLocalizationsOf(context).close,
          icon: Icon(
            Icons.close_rounded,
            size: 24,
            color: LinkVaultThemeTokens.ink(context),
          ),
        ),
      ],
    );
  }
}
