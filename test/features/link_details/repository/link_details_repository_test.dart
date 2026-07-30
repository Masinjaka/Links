import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/drift_add_link_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/link_details/repository/link_details_repository.dart';

void main() {
  test('resolves the collection attached to a bookmark', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final collectionId = await database
        .into(database.collections)
        .insert(CollectionsCompanion.insert(title: 'Reading', type: 'PRIVATE'));
    final linkId = await DriftAddLinkRepository(database).create(
      LinkDraft(url: 'example.com/article', collectionIds: [collectionId]),
    );

    final collection = await DriftLinkDetailsRepository(
      database,
    ).watchCollection(linkId).first;

    expect(collection?.id, collectionId);
    expect(collection?.title, 'Reading');
  });
}
