import 'package:linkvault/features/feed/domain/bookmark_state.dart';

enum BookmarkScope { library, inbox, active, archived, trashed, all }

class FeedQuery {
  const FeedQuery({
    this.text = '',
    this.scope = BookmarkScope.library,
    this.tag,
    this.collectionId,
    this.domain,
    this.contentType,
    this.favourite,
    this.availableOffline,
    this.broken,
    this.addedFrom,
    this.addedTo,
    this.sort = FeedSort.recentlyAdded,
  });

  final String text;
  final BookmarkScope scope;
  final String? tag;
  final int? collectionId;
  final String? domain;
  final String? contentType;
  final bool? favourite;
  final bool? availableOffline;
  final bool? broken;
  final DateTime? addedFrom;
  final DateTime? addedTo;
  final FeedSort sort;
}
