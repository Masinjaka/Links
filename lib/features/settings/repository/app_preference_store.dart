import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';

abstract interface class AppPreferenceStore {
  Future<String?> readString(String key);
  Future<void> writeString(String key, String value);
}

class DriftAppPreferenceStore implements AppPreferenceStore {
  const DriftAppPreferenceStore(this._database);

  static const _section = 'APP_PREFERENCES';
  static const _kind = 'preference';

  final AppDatabase _database;

  @override
  Future<String?> readString(String key) async {
    final query = _database.select(_database.settingItems)
      ..where((item) => item.kind.equals(_kind) & item.title.equals(key))
      ..limit(1);
    return (await query.getSingleOrNull())?.subtitle;
  }

  @override
  Future<void> writeString(String key, String value) {
    return _database.transaction(() async {
      final query = _database.select(_database.settingItems)
        ..where((item) => item.kind.equals(_kind) & item.title.equals(key))
        ..limit(1);
      final existing = await query.getSingleOrNull();
      if (existing != null) {
        await (_database.update(_database.settingItems)
              ..where((item) => item.id.equals(existing.id)))
            .write(SettingItemsCompanion(subtitle: Value(value)));
        return;
      }

      await _database
          .into(_database.settingItems)
          .insert(
            SettingItemsCompanion.insert(
              section: _section,
              title: key,
              subtitle: Value(value),
              kind: const Value(_kind),
              iconKey: const Value('settings'),
              sortOrder: 1000,
            ),
          );
    });
  }
}
