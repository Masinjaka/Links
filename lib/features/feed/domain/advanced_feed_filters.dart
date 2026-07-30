class AdvancedFeedFilters {
  const AdvancedFeedFilters({
    this.collectionId,
    this.domain,
    this.contentType,
    this.availableOffline,
    this.broken,
    this.addedFrom,
    this.addedTo,
  });

  final int? collectionId;
  final String? domain;
  final String? contentType;
  final bool? availableOffline;
  final bool? broken;
  final DateTime? addedFrom;
  final DateTime? addedTo;

  int get activeCount => [
    collectionId,
    domain,
    contentType,
    availableOffline,
    broken,
    addedFrom,
    addedTo,
  ].where((value) => value != null).length;

  AdvancedFeedFilters copyWith({
    int? collectionId,
    String? domain,
    String? contentType,
    bool? availableOffline,
    bool? broken,
    DateTime? addedFrom,
    DateTime? addedTo,
  }) {
    return AdvancedFeedFilters(
      collectionId: collectionId ?? this.collectionId,
      domain: domain ?? this.domain,
      contentType: contentType ?? this.contentType,
      availableOffline: availableOffline ?? this.availableOffline,
      broken: broken ?? this.broken,
      addedFrom: addedFrom ?? this.addedFrom,
      addedTo: addedTo ?? this.addedTo,
    );
  }
}
