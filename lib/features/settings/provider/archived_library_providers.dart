import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/domain/bookmark_state.dart';
import 'package:linkvault/features/feed/domain/feed_query.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

typedef ArchivedLinkQuery = ({String text, String? tag, FeedSort sort});

final archivedLinksProvider = StreamProvider.autoDispose
    .family<List<LinkWithTags>, ArchivedLinkQuery>((ref, query) async* {
      await ref.watch(seedDatabaseProvider.future);
      yield* ref
          .watch(feedRepositoryProvider)
          .watchLinks(
            FeedQuery(
              text: query.text,
              scope: BookmarkScope.archived,
              tag: query.tag,
              sort: query.sort,
            ),
          );
    });

final archivedCollectionsProvider =
    StreamProvider.autoDispose<List<CollectionWithCount>>((ref) async* {
      await ref.watch(seedDatabaseProvider.future);
      yield* ref
          .watch(collectionsRepositoryProvider)
          .watchArchivedCollections();
    });
