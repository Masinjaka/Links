import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/settings/repository/app_preference_store.dart';

void main() {
  test('Drift preference store persists and updates a value', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final store = DriftAppPreferenceStore(database);

    await store.writeString('theme', 'dark');
    expect(await store.readString('theme'), 'dark');

    await store.writeString('theme', 'system');
    expect(await store.readString('theme'), 'system');

    final rows = await (database.select(
      database.settingItems,
    )..where((item) => item.kind.equals('preference'))).get();
    expect(rows, hasLength(1));
  });
}
