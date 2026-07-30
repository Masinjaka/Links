part of 'collections_widgets.dart';

class CollectionsGrid extends StatelessWidget {
  const CollectionsGrid({
    super.key,
    required this.items,
    this.onOpen,
    this.selectionMode = false,
    this.selectedIds = const <int>{},
    this.onToggleSelection,
  });

  final List<CollectionWithCount> items;
  final ValueChanged<CollectionWithCount>? onOpen;
  final bool selectionMode;
  final Set<int> selectedIds;
  final ValueChanged<CollectionWithCount>? onToggleSelection;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = items[index];
        return CollectionFeedCard(
              group: item,
              onOpen: onOpen == null ? null : () => onOpen!(item),
              selectionMode: selectionMode,
              selected: selectedIds.contains(item.collection.id),
              onToggleSelection: onToggleSelection == null
                  ? null
                  : () => onToggleSelection!(item),
            )
            .animate(delay: (60 * index).ms)
            .fadeIn(duration: 240.ms)
            .slideY(begin: .05, end: 0, curve: Curves.easeOutCubic);
      },
    );
  }
}
