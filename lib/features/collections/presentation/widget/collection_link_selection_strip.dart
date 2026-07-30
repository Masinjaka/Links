import 'package:flutter/material.dart';

import 'package:linkvault/shared/presentation/widgets/select_all_strip.dart';

class CollectionLinkSelectionStrip extends StatelessWidget {
  const CollectionLinkSelectionStrip({
    super.key,
    required this.visible,
    required this.allSelected,
    required this.onSelectAll,
    required this.onCancel,
  });

  final bool visible;
  final bool allSelected;
  final VoidCallback onSelectAll;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      key: const Key('collection-link-selection-animation'),
      duration: const Duration(milliseconds: 240),
      reverseDuration: const Duration(milliseconds: 180),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: -1,
            child: child,
          ),
        );
      },
      child: visible
          ? Padding(
              key: const ValueKey('collection-selection-visible'),
              padding: const EdgeInsets.only(top: 12),
              child: KeyedSubtree(
                key: const Key('collection-link-select-all'),
                child: SelectAllStrip(
                  selected: allSelected,
                  onTap: onSelectAll,
                  onCancel: onCancel,
                ),
              ),
            )
          : const SizedBox(key: ValueKey('collection-selection-hidden')),
    );
  }
}
