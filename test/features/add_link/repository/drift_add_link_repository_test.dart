import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/add_link_repository.dart';
import 'package:linkvault/features/add_link/repository/drift_add_link_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

void main() {
  late AppDatabase database;
  late DriftAddLinkRepository repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    repository = DriftAddLinkRepository(database);
  });

  tearDown(() => database.close());

  test('persists an inbox bookmark and queues metadata immediately', () async {
    final id = await repository.create(
      const LinkDraft(url: 'example.com/article?utm_source=test'),
    );

    final link = await (database.select(
      database.links,
    )..where((table) => table.id.equals(id))).getSingle();
    final tasks = await database.select(database.pendingTasks).get();

    expect(link.status, 'inbox');
    expect(link.normalizedUrl, 'https://example.com/article');
    expect(link.originalUrl, 'example.com/article?utm_source=test');
    expect(link.metadataStatus, 'pending');
    expect(tasks.single.bookmarkId, id);
    expect(tasks.single.taskType, 'fetchMetadata');
  });

  test('detects normalized duplicates before insertion', () async {
    await repository.create(const LinkDraft(url: 'https://example.com/page'));

    expect(
      () => repository.create(
        const LinkDraft(url: 'http://m.example.com/page/?utm_medium=share'),
      ),
      throwsA(isA<DuplicateBookmarkException>()),
    );
  });

  test('save anyway preserves both bookmark records', () async {
    await repository.create(const LinkDraft(url: 'https://example.com/page'));
    await repository.create(
      const LinkDraft(url: 'https://example.com/page'),
      allowDuplicate: true,
    );

    final links = await database.select(database.links).get();
    expect(links, hasLength(2));
    expect(links.map((link) => link.originalUrl).toSet(), {
      'https://example.com/page',
    });
    expect(links.map((link) => link.url).toSet(), hasLength(2));
  });

  test('links with organisation are active', () async {
    final id = await repository.create(
      const LinkDraft(url: 'example.com', tags: ['research']),
    );

    final link = await (database.select(
      database.links,
    )..where((table) => table.id.equals(id))).getSingle();
    expect(link.status, 'active');
    expect(
      (await repository.watchLink(id).first)!.tags.single.name,
      'RESEARCH',
    );
  });

  test('creates the link and collection relationship atomically', () async {
    final collectionId = await database
        .into(database.collections)
        .insert(CollectionsCompanion.insert(title: 'Reading', type: 'PRIVATE'));

    final linkId = await repository.create(
      LinkDraft(url: 'example.com/reading', collectionIds: [collectionId]),
    );

    final relationship = await database
        .select(database.collectionLinks)
        .getSingle();
    expect(relationship.collectionId, collectionId);
    expect(relationship.linkId, linkId);
  });
}
