import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/drift_add_link_repository.dart';
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

  test('trash and restore preserve relationships and lifecycle', () async {
    final id = await addRepository.create(
      const LinkDraft(url: 'example.com', tags: ['RESEARCH']),
    );

    await feedRepository.trashLinks([id]);
    var link = await _link(database, id);
    expect(link.status, 'trashed');
    expect(link.deletedAt, isNotNull);
    expect((await addRepository.watchLink(id).first)!.tags, hasLength(1));

    await feedRepository.restoreLinks([id]);
    link = await _link(database, id);
    expect(link.status, 'active');
    expect(link.deletedAt, isNull);
    expect(
      (await addRepository.watchLink(id).first)!.tags.single.name,
      'RESEARCH',
    );
  });

  test('favourite remains independent when bookmark is archived', () async {
    final id = await addRepository.create(
      const LinkDraft(url: 'example.com/favourite'),
    );

    await feedRepository.setFavourite([id], true);
    await feedRepository.archiveLinks([id]);

    final link = await _link(database, id);
    expect(link.isFavourite, isTrue);
    expect(link.status, 'archived');
  });

  test('note updates the timestamp and full-text index', () async {
    final id = await addRepository.create(
      const LinkDraft(url: 'example.com/note'),
    );
    final before = (await _link(database, id)).updatedAt;
    await Future<void>.delayed(const Duration(milliseconds: 2));

    await feedRepository.updateNote(id, 'A uniquely searchable thought');

    final link = await _link(database, id);
    final results = await feedRepository
        .watchLinks(const FeedQuery(text: 'uniquely'))
        .first;
    expect(link.note, 'A uniquely searchable thought');
    expect(link.updatedAt.isAfter(before), isTrue);
    expect(results.single.link.id, id);
  });

  test(
    'permanent deletion is restricted to trashed or archived links',
    () async {
      final id = await addRepository.create(
        const LinkDraft(url: 'example.com/delete', tags: ['TEMP']),
      );
      await feedRepository.deletePermanently([id]);
      expect(await _link(database, id), isNotNull);

      await feedRepository.trashLinks([id]);
      await feedRepository.deletePermanently([id]);

      expect(
        await (database.select(
          database.links,
        )..where((table) => table.id.equals(id))).getSingleOrNull(),
        isNull,
      );
      expect(await database.select(database.linkTags).get(), isEmpty);

      final archivedId = await addRepository.create(
        const LinkDraft(url: 'example.com/archived-delete'),
      );
      await feedRepository.archiveLinks([archivedId]);
      await feedRepository.deletePermanently([archivedId]);
      expect(
        await (database.select(
          database.links,
        )..where((table) => table.id.equals(archivedId))).getSingleOrNull(),
        isNull,
      );
    },
  );
}

Future<Link> _link(AppDatabase database, int id) {
  return (database.select(
    database.links,
  )..where((table) => table.id.equals(id))).getSingle();
}
