import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/collections/repository/drift_collections_repository.dart';

void main() {
  test('persists collection favorite and pin state', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final repository = DriftCollectionsRepository(database);
    final id = await repository.create('Reading', 'CUSTOM', 'folder');

    await repository.setFavourite(id, true);
    await repository.setPinned(id, true);

    final collection = await repository.watchCollection(id).first;
    expect(collection?.isFavourite, isTrue);
    expect(collection?.isPinned, isTrue);
  });

  test(
    'loads the first three link preview images in newest-first order',
    () async {
      final database = AppDatabase(NativeDatabase.memory());
      addTearDown(database.close);
      final repository = DriftCollectionsRepository(database);
      final collectionId = await repository.create(
        'Development',
        'CUSTOM',
        'terminal',
      );

      for (var index = 0; index < 4; index++) {
        final linkId = await database
            .into(database.links)
            .insert(
              LinksCompanion.insert(
                title: 'Link $index',
                url: 'https://example.com/$index',
                domain: 'example.com',
                sourceImageUrl: Value('https://images.example.com/$index.jpg'),
                createdAt: Value(DateTime(2024, 1, index + 1)),
              ),
            );
        await repository.addLink(collectionId, linkId);
      }

      final collection = (await repository.watchCollections().first).single;
      expect(collection.count, 4);
      expect(collection.previewImageUrls, [
        'https://images.example.com/3.jpg',
        'https://images.example.com/2.jpg',
        'https://images.example.com/1.jpg',
      ]);
    },
  );
}
