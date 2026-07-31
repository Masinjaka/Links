import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/settings/repository/settings_csv_exporter.dart';
import 'package:linkvault/features/settings/repository/settings_data_eraser.dart';
import 'package:linkvault/features/settings/repository/managed_tag.dart';
import 'package:linkvault/features/settings/repository/settings_tag_manager.dart';

class SettingOption {
  const SettingOption({
    required this.id,
    required this.section,
    required this.title,
    required this.subtitle,
    required this.kind,
    required this.iconKey,
    required this.enabled,
  });

  final int id;
  final String section;
  final String title;
  final String subtitle;
  final String kind;
  final String iconKey;
  final bool enabled;
}

abstract interface class SettingsRepository {
  Stream<List<SettingOption>> watchSettings();
  Future<void> updateSettingEnabled(int id, bool enabled);
  Future<String> exportLinksCsv();
  Future<void> eraseAllData();
  Stream<List<ManagedTag>> watchLinkTags();
  Stream<List<ManagedTag>> watchCollectionTags();
  Future<void> deleteLinkTags(Iterable<String> names);
  Future<void> deleteCollectionTags(Iterable<String> names);
}

class DriftSettingsRepository
    with SettingsCsvExporter, SettingsDataEraser, SettingsTagManager
    implements SettingsRepository {
  const DriftSettingsRepository(this._db);

  final AppDatabase _db;

  @override
  AppDatabase get settingsDatabase => _db;

  @override
  Stream<List<SettingOption>> watchSettings() {
    final query = _db.select(_db.settingItems)
      ..orderBy([(table) => OrderingTerm.asc(table.sortOrder)]);
    return query.watch().map((items) {
      return [
        for (final item in items)
          SettingOption(
            id: item.id,
            section: item.section,
            title: item.title,
            subtitle: item.subtitle,
            kind: item.kind,
            iconKey: item.iconKey,
            enabled: item.enabled,
          ),
      ];
    });
  }

  @override
  Future<void> updateSettingEnabled(int id, bool enabled) {
    return (_db.update(_db.settingItems)..where((table) => table.id.equals(id)))
        .write(SettingItemsCompanion(enabled: Value(enabled)));
  }
}
