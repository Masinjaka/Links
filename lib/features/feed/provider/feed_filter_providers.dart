import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/domain/advanced_feed_filters.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';

part 'feed_filter_providers.g.dart';

@riverpod
class AdvancedFeedFilterState extends _$AdvancedFeedFilterState {
  @override
  AdvancedFeedFilters build() => const AdvancedFeedFilters();

  void setCollection(int? value) {
    state = AdvancedFeedFilters(
      collectionId: value,
      domain: state.domain,
      contentType: state.contentType,
      availableOffline: state.availableOffline,
      broken: state.broken,
      addedFrom: state.addedFrom,
      addedTo: state.addedTo,
    );
  }

  void setDomain(String? value) {
    state = AdvancedFeedFilters(
      collectionId: state.collectionId,
      domain: value,
      contentType: state.contentType,
      availableOffline: state.availableOffline,
      broken: state.broken,
      addedFrom: state.addedFrom,
      addedTo: state.addedTo,
    );
  }

  void setContentType(String? value) {
    state = AdvancedFeedFilters(
      collectionId: state.collectionId,
      domain: state.domain,
      contentType: value,
      availableOffline: state.availableOffline,
      broken: state.broken,
      addedFrom: state.addedFrom,
      addedTo: state.addedTo,
    );
  }

  void setAvailableOffline(bool? value) {
    state = AdvancedFeedFilters(
      collectionId: state.collectionId,
      domain: state.domain,
      contentType: state.contentType,
      availableOffline: value,
      broken: state.broken,
      addedFrom: state.addedFrom,
      addedTo: state.addedTo,
    );
  }

  void setBroken(bool? value) {
    state = AdvancedFeedFilters(
      collectionId: state.collectionId,
      domain: state.domain,
      contentType: state.contentType,
      availableOffline: state.availableOffline,
      broken: value,
      addedFrom: state.addedFrom,
      addedTo: state.addedTo,
    );
  }

  void setDates(DateTime? from, DateTime? to) {
    state = AdvancedFeedFilters(
      collectionId: state.collectionId,
      domain: state.domain,
      contentType: state.contentType,
      availableOffline: state.availableOffline,
      broken: state.broken,
      addedFrom: from,
      addedTo: to,
    );
  }

  void clear() => state = const AdvancedFeedFilters();
}

final feedDomainsProvider = StreamProvider<List<String>>((ref) {
  return ref.watch(feedRepositoryProvider).watchDomains();
});

final feedContentTypesProvider = StreamProvider<List<String>>((ref) {
  return ref.watch(feedRepositoryProvider).watchContentTypes();
});

final feedCollectionsProvider = StreamProvider<List<Collection>>((ref) {
  return ref.watch(feedRepositoryProvider).watchCollections();
});
