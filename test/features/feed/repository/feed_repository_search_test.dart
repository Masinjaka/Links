import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/drift_add_link_repository.dart';
import 'package:linkvault/features/feed/domain/bookmark_state.dart';
import 'package:linkvault/features/feed/domain/feed_query.dart';
import 'package:linkvault/features/feed/repository/feed_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

void main() {
  late AppDatabase database;
  late DriftAddLinkRepository addRepository;
  late DriftFeedRepository feedRepository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    addRepository = DriftAddLinkRepository(database);
    feedRepository = DriftFeedRepository(database);
  });

  tearDown(() => database.close());

  test(
    'FTS finds description, note, and tag without scanning in Dart',
    () async {
      await addRepository.create(
        const LinkDraft(
          url: 'example.com/flutter',
          description: 'Declarative mobile toolkit',
          note: 'Review animation performance',
          tags: ['ENGINEERING'],
        ),
      );
      await addRepository.create(
        const LinkDraft(url: 'example.com/design', tags: ['DESIGN']),
      );

      for (final query in ['declarative', 'animation', 'engineering']) {
        final results = await feedRepository
            .watchLinks(FeedQuery(text: query))
            .first;
        expect(results, hasLength(1), reason: query);
        expect(results.single.link.displayUrl, contains('/flutter'));
      }
    },
  );

  test(
    'archive scope remains queryable and supports unambiguous sorting',
    () async {
      final oldId = await addRepository.create(
        const LinkDraft(url: 'example.com/old', tags: ['TEST']),
      );
      final newId = await addRepository.create(
        const LinkDraft(url: 'example.com/new', tags: ['TEST']),
      );
      await feedRepository.archiveLinks([oldId]);

      final archived = await feedRepository
          .watchLinks(const FeedQuery(scope: BookmarkScope.archived))
          .first;
      final active = await feedRepository
          .watchLinks(
            const FeedQuery(scope: BookmarkScope.active, sort: FeedSort.oldest),
          )
          .first;

      expect(archived.single.link.id, oldId);
      expect(active.single.link.id, newId);
    },
  );
}
