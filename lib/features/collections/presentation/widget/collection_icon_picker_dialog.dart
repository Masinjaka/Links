part of 'add_collection_widgets.dart';

class CollectionIconPickerDialog extends StatefulWidget {
  const CollectionIconPickerDialog({super.key, required this.selectedIconKey});

  final String selectedIconKey;

  @override
  State<CollectionIconPickerDialog> createState() =>
      _CollectionIconPickerDialogState();
}

class _CollectionIconPickerDialogState
    extends State<CollectionIconPickerDialog> {
  late String _selectedIconKey = widget.selectedIconKey;

  @override
  Widget build(BuildContext context) {
    final surface = LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: LinkVaultThemeTokens.componentRadius,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'SELECT_COLLECTION_ICON'.displayText,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 6),
            Text(
              'Choose the icon that best fits this collection.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: LinkVaultColors.secondary,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 360,
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: collectionIconOptions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: .9,
                ),
                itemBuilder: (context, index) {
                  final option = collectionIconOptions[index];
                  final selected = option.key == _selectedIconKey;

                  return Material(
                    color: selected ? LinkVaultColors.primary : surface,
                    borderRadius: LinkVaultThemeTokens.componentRadius,
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIconKey = option.key;
                        });
                      },
                      borderRadius: LinkVaultThemeTokens.componentRadius,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: selected
                            ? null
                            : BoxDecoration(
                                border: Border.all(color: ink),
                                borderRadius:
                                    LinkVaultThemeTokens.componentRadius,
                              ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              option.icon,
                              color: selected ? LinkVaultColors.onPrimary : ink,
                              size: 28,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              option.label.displayText,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: selected
                                        ? LinkVaultColors.onPrimary
                                        : ink,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: VelocityButton(
                    label: 'CANCEL',
                    filled: false,
                    borderColor: ink,
                    foregroundColor: ink,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: VelocityButton(
                    label: 'USE_ICON',
                    onPressed: () {
                      Navigator.of(context).pop(_selectedIconKey);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
