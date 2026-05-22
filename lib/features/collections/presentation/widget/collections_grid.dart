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
    return LayoutBuilder(
      builder: (context, constraints) {
        const crossAxisCount = 2;
        const spacing = 16.0;
        final width = constraints.maxWidth;
        final cardWidth =
            (width - (spacing * (crossAxisCount - 1))) / crossAxisCount;
        final cardHeight = cardWidth * .92;
        final ratio = cardWidth / cardHeight;

        return GridView.builder(
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: ratio,
          ),
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
                .animate(delay: (70 * index).ms)
                .fadeIn(duration: 280.ms)
                .slideY(begin: .08, end: 0, curve: Curves.easeOutCubic);
          },
        );
      },
    );
  }
}
