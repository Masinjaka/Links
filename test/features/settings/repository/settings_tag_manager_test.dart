import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/drift_add_link_repository.dart';
import 'package:linkvault/features/collections/repository/drift_collections_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/settings/repository/settings_repository.dart';

void main() {
  test('tag deletion preserves links and collections', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final addRepository = DriftAddLinkRepository(database);
    final collectionsRepository = DriftCollectionsRepository(database);
    final settingsRepository = DriftSettingsRepository(database);

    await addRepository.create(
      const LinkDraft(url: 'example.com', tags: ['DESIGN']),
    );
    await collectionsRepository.create(
      'Development',
      'General',
      'code',
      tagName: 'DEVELOPMENT',
    );

    final linkTags = await settingsRepository.watchLinkTags().first;
    final collectionTags = await settingsRepository.watchCollectionTags().first;
    expect(linkTags.single.name, 'DESIGN');
    expect(linkTags.single.usageCount, 1);
    expect(collectionTags.single.name, 'DEVELOPMENT');
    expect(collectionTags.single.usageCount, 1);

    await settingsRepository.deleteLinkTags(['DESIGN']);
    await settingsRepository.deleteCollectionTags(['DEVELOPMENT']);

    expect(await database.select(database.links).get(), hasLength(1));
    expect(await database.select(database.collections).get(), hasLength(1));
    expect(await database.select(database.tags).get(), isEmpty);
    expect(await database.select(database.linkTags).get(), isEmpty);
    expect(
      (await database.select(database.collections).get()).single.tagName,
      isEmpty,
    );
  });
}
