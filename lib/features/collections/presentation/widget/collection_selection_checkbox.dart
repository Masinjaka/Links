part of 'collections_widgets.dart';

class _CollectionSelectionCheckbox extends StatelessWidget {
  const _CollectionSelectionCheckbox({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final ink = LinkVaultThemeTokens.ink(context);
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: selected
            ? LinkVaultColors.primary
            : LinkVaultThemeTokens.surface(context),
        border: Border.all(
          color: selected ? LinkVaultColors.primary : ink,
          width: 2,
        ),
      ),
      child: selected
          ? Icon(
              Icons.check_rounded,
              size: 16,
              color: LinkVaultColors.onPrimary,
            )
          : null,
    );
  }
}
