part of 'add_collection_widgets.dart';

class CollectionIconSelector extends StatelessWidget {
  const CollectionIconSelector({
    super.key,
    required this.selectedIconKey,
    required this.onPressed,
  });

  final String selectedIconKey;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final icon = collectionIconForKey(selectedIconKey);
    final surface = LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);

    return Material(
      color: Colors.transparent,
      borderRadius: LinkVaultThemeTokens.componentRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        borderRadius: LinkVaultThemeTokens.componentRadius,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: surface,
            borderRadius: LinkVaultThemeTokens.componentRadius,
          ),
          child: Row(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: LinkVaultThemeTokens.componentRadius,
                ),
                child: Icon(icon, color: ink, size: 34),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      linkVaultLocalizationsOf(context).currentIcon,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: LinkVaultColors.secondary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      linkVaultLocalizationsOf(context).icon,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Icon(Icons.grid_view_rounded, color: ink, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
