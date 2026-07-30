import 'package:flutter/material.dart';

import 'package:linkvault/features/collections/presentation/widget/collection_sort_button.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/feed/domain/bookmark_state.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_sort_button.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_library_tabs.dart';

class ArchivedSortButton extends StatelessWidget {
  const ArchivedSortButton({
    super.key,
    required this.tab,
    required this.linkSort,
    required this.collectionSort,
    required this.onLinkSort,
    required this.onCollectionSort,
  });

  final ArchivedLibraryTab tab;
  final FeedSort linkSort;
  final CollectionSort collectionSort;
  final ValueChanged<FeedSort> onLinkSort;
  final ValueChanged<CollectionSort> onCollectionSort;

  @override
  Widget build(BuildContext context) {
    if (tab == ArchivedLibraryTab.links) {
      return FeedSortButton(selected: linkSort, onSelected: onLinkSort);
    }
    return CollectionSortButton(
      selected: collectionSort,
      onSelected: onCollectionSort,
    );
  }
}
