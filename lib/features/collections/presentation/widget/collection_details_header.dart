part of 'collection_details_widgets.dart';

class CollectionDetailsHeader extends StatelessWidget {
  const CollectionDetailsHeader({
    super.key,
    required this.collection,
    required this.onBack,
    required this.onEdit,
    required this.onArchive,
  });

  final CollectionWithCount collection;
  final VoidCallback onBack;
  final VoidCallback onEdit;
  final VoidCallback onArchive;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SquareButton(
              onPressed: onBack,
              backgroundColor: LinkVaultThemeTokens.surface(context),
              icon: Icons.arrow_back_ios_new_rounded,
              iconColor: LinkVaultColors.primary,
              shadowed: false,
              tooltip: linkVaultLocalizationsOf(context).back,
              size: 45,
              borderColor: LinkVaultColors.ink,
            ),
            Row(
              children: [
                SquareButton(
                  onPressed: onEdit,
                  backgroundColor: LinkVaultThemeTokens.surface(context),
                  icon: Icons.edit_note_rounded,
                  shadowed: false,
                  tooltip: linkVaultLocalizationsOf(context).edit,
                  size: 45,
                  borderColor: LinkVaultColors.ink,
                ),
                const SizedBox(width: 12),
                SquareButton(
                  onPressed: onArchive,
                  tooltip: linkVaultLocalizationsOf(context).archive,
                  icon: Icons.archive_outlined,
                  size: 45,
                  shadowed: false,
                  backgroundColor: LinkVaultThemeTokens.surface(context),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        VelocityPanel(
          padding: const EdgeInsets.all(24),
          backgroundColor: LinkVaultThemeTokens.surface(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: LinkVaultThemeTokens.surface(context),
                      borderRadius: LinkVaultThemeTokens.componentRadius,
                    ),
                    child: Icon(
                      collectionIconForKey(collection.collection.iconKey),
                      color: LinkVaultThemeTokens.ink(context),
                      size: 34,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          linkVaultLocalizationsOf(context).collection,
                          style: textTheme.labelLarge?.copyWith(
                            color: LinkVaultColors.secondary,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          collection.collection.title.displayText,
                          style: textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  VelocityChip(
                    label: linkVaultLocalizationsOf(
                      context,
                    ).linkCount(collection.count),
                    selected: true,
                  ),
                  VelocityChip(label: collection.collection.type),
                  if (collection.collection.tagName.isNotEmpty)
                    VelocityChip(label: collection.collection.tagName),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
