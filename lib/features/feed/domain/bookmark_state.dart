enum BookmarkStatus {
  inbox,
  active,
  archived,
  trashed;

  static BookmarkStatus parse(String value) {
    return values.firstWhere(
      (item) => item.name == value,
      orElse: () => active,
    );
  }
}

enum MetadataStatus {
  pending,
  fetching,
  completed,
  failed;

  static MetadataStatus parse(String value) {
    return values.firstWhere(
      (item) => item.name == value,
      orElse: () => pending,
    );
  }
}

enum FeedSort {
  recentlyAdded,
  oldest,
  recentlyUpdated,
  recentlyOpened,
  alphabetical,
  domain,
  manual,
}
