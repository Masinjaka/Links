import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/collections/repository/drift_collections_repository.dart';
import 'package:linkvault/features/feed/repository/bookmark_lifecycle_writer.dart';

void main() {
  test('collection cards react when a link is added and removed', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final repository = DriftCollectionsRepository(database);
    final collectionId = await repository.create(
      'Reactive',
      'CUSTOM',
      'folder',
    );
    final linkId = await database
        .into(database.links)
        .insert(
          LinksCompanion.insert(
            title: 'Reactive link',
            url: 'https://example.com/reactive',
            domain: 'example.com',
            sourceImageUrl: const Value(
              'https://images.example.com/reactive.jpg',
            ),
          ),
        );
    final cards = StreamIterator(repository.watchCollections());
    addTearDown(cards.cancel);

    expect(await cards.moveNext(), isTrue);
    expect(cards.current.single.count, 0);
    expect(cards.current.single.previewImageUrls, isEmpty);

    await repository.addLink(collectionId, linkId);
    expect(await cards.moveNext(), isTrue);
    expect(cards.current.single.count, 1);
    expect(cards.current.single.previewImageUrls, [
      'https://images.example.com/reactive.jpg',
    ]);

    await repository.removeLink(collectionId, linkId);
    expect(await cards.moveNext(), isTrue);
    expect(cards.current.single.count, 0);
    expect(cards.current.single.previewImageUrls, isEmpty);
  });

  test('collection cards react when some or all links are archived', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final repository = DriftCollectionsRepository(database);
    final lifecycle = BookmarkLifecycleWriter(database);
    final collectionId = await repository.create(
      'Archive reactive',
      'CUSTOM',
      'folder',
    );
    final olderLinkId = await database
        .into(database.links)
        .insert(
          LinksCompanion.insert(
            title: 'Older link',
            url: 'https://example.com/older',
            domain: 'example.com',
            sourceImageUrl: const Value('https://images.example.com/older.jpg'),
            createdAt: Value(DateTime(2024)),
          ),
        );
    final newerLinkId = await database
        .into(database.links)
        .insert(
          LinksCompanion.insert(
            title: 'Newer link',
            url: 'https://example.com/newer',
            domain: 'example.com',
            sourceImageUrl: const Value('https://images.example.com/newer.jpg'),
            createdAt: Value(DateTime(2024, 1, 2)),
          ),
        );
    await repository.addLink(collectionId, olderLinkId);
    await repository.addLink(collectionId, newerLinkId);
    final cards = StreamIterator(repository.watchCollections());
    addTearDown(cards.cancel);

    expect(await cards.moveNext(), isTrue);
    expect(cards.current.single.count, 2);
    expect(cards.current.single.previewImageUrls, [
      'https://images.example.com/newer.jpg',
      'https://images.example.com/older.jpg',
    ]);

    await lifecycle.archive([newerLinkId]);
    expect(await cards.moveNext(), isTrue);
    expect(cards.current.single.count, 1);
    expect(cards.current.single.previewImageUrls, [
      'https://images.example.com/older.jpg',
    ]);

    await lifecycle.archive([olderLinkId]);
    expect(await cards.moveNext(), isTrue);
    expect(cards.current.single.count, 0);
    expect(cards.current.single.previewImageUrls, isEmpty);
  });
}
