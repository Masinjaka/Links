import 'package:flutter/material.dart';
import 'package:linkvault/features/feed/presentation/widgets/filter_chip_widget.dart';

class FeedFilterRail extends StatelessWidget {
  const FeedFilterRail({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onSelected,
  });

  final List<String> filters;
  final String selectedFilter;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          for (final filter in filters) ...[
            FeedFilterChip(
              label: filter,
              selected: filter == selectedFilter,
              onTap: () => onSelected(filter),
            ),
            if (filter != filters.last) const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}