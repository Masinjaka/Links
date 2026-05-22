part of 'collection_details_widgets.dart';

class CollectionLinkPickerDialog extends ConsumerStatefulWidget {
  const CollectionLinkPickerDialog({super.key, required this.collectionId});

  final int collectionId;

  @override
  ConsumerState<CollectionLinkPickerDialog> createState() =>
      _CollectionLinkPickerDialogState();
}

class _CollectionLinkPickerDialogState
    extends ConsumerState<CollectionLinkPickerDialog> {
  final _selectedLinkIds = <int>{};

  @override
  Widget build(BuildContext context) {
    final links = ref.watch(
      availableCollectionLinksProvider(widget.collectionId),
    );
    final surface = LinkVaultThemeTokens.surface(context);

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ADD_LINKS',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Select existing saved links to attach to this collection.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: LinkVaultColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                SquareButton(
                  onPressed: () => Navigator.of(context).pop(),
                  backgroundColor: surface,
                  icon: Icons.close_sharp,
                  iconColor: LinkVaultColors.primary,
                  shadowed: false,
                  tooltip: 'CLOSE',
                  size: 45,
                  borderColor: LinkVaultColors.ink,
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 420,
              child: links.when(
                data: (items) {
                  if (items.isEmpty) {
                    return Center(
                      child: Text(
                        'NO_AVAILABLE_LINKS',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final selected = _selectedLinkIds.contains(item.link.id);

                      return _SelectableCollectionLinkRow(
                        link: item,
                        selected: selected,
                        onToggle: () {
                          setState(() {
                            if (selected) {
                              _selectedLinkIds.remove(item.link.id);
                            } else {
                              _selectedLinkIds.add(item.link.id);
                            }
                          });
                        },
                      );
                    },
                  );
                },
                error: (_, _) => Center(
                  child: Text(
                    'DATABASE_ERROR',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(
                    color: LinkVaultColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            VelocityButton(
              label: _selectedLinkIds.isEmpty
                  ? 'SELECT_LINKS_TO_ADD'
                  : 'ADD_SELECTED_${_selectedLinkIds.length}',
              icon: Icons.add_link_rounded,
              onPressed: _selectedLinkIds.isEmpty
                  ? null
                  : () {
                      Navigator.of(
                        context,
                      ).pop(_selectedLinkIds.toList(growable: false));
                    },
            ),
          ],
        ),
      ),
    );
  }
}
