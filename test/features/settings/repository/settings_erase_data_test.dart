import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/drift_add_link_repository.dart';
import 'package:linkvault/features/collections/repository/drift_collections_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/settings/repository/settings_repository.dart';

void main() {
  test(
    'erase removes library data but preserves structural settings',
    () async {
      final database = AppDatabase(NativeDatabase.memory());
      addTearDown(database.close);
      final addRepository = DriftAddLinkRepository(database);
      final collectionsRepository = DriftCollectionsRepository(database);
      final settingsRepository = DriftSettingsRepository(database);

      final linkId = await addRepository.create(
        const LinkDraft(url: 'example.com', tags: ['PRIVATE']),
      );
      final collectionId = await collectionsRepository.create(
        'Private',
        'General',
        'folder',
      );
      await collectionsRepository.addLink(collectionId, linkId);
      await database
          .into(database.settingItems)
          .insert(
            SettingItemsCompanion.insert(
              section: 'APP',
              title: 'Theme',
              sortOrder: 0,
            ),
          );

      await settingsRepository.eraseAllData();

      expect(await database.select(database.links).get(), isEmpty);
      expect(await database.select(database.collections).get(), isEmpty);
      expect(await database.select(database.tags).get(), isEmpty);
      expect(await database.select(database.linkTags).get(), isEmpty);
      expect(await database.select(database.collectionLinks).get(), isEmpty);
      expect(await database.select(database.settingItems).get(), hasLength(1));
    },
  );
}
