import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/settings/repository/managed_tag.dart';

mixin SettingsTagManager {
  AppDatabase get settingsDatabase;

  Stream<List<ManagedTag>> watchLinkTags() {
    return settingsDatabase
        .customSelect(
          '''
          SELECT tags.name AS name, COUNT(link_tags.link_id) AS usage_count
          FROM tags
          LEFT JOIN link_tags ON link_tags.tag_id = tags.id
          WHERE UPPER(TRIM(tags.name)) NOT IN ('ARCHIVE', 'ARCHIVED')
          GROUP BY tags.id, tags.name
          ORDER BY LOWER(tags.name)
          ''',
          readsFrom: {settingsDatabase.tags, settingsDatabase.linkTags},
        )
        .watch()
        .map(_mapTags);
  }

  Stream<List<ManagedTag>> watchCollectionTags() {
    return settingsDatabase
        .customSelect(
          '''
          SELECT tag_name AS name, COUNT(*) AS usage_count
          FROM collections
          WHERE TRIM(tag_name) <> ''
            AND UPPER(TRIM(tag_name)) NOT IN ('ARCHIVE', 'ARCHIVED')
          GROUP BY tag_name
          ORDER BY LOWER(tag_name)
          ''',
          readsFrom: {settingsDatabase.collections},
        )
        .watch()
        .map(_mapTags);
  }

  Future<void> deleteLinkTags(Iterable<String> names) async {
    final values = names.toSet();
    if (values.isEmpty) return;
    final database = settingsDatabase;
    await database.transaction(() async {
      final tags = await (database.select(
        database.tags,
      )..where((table) => table.name.isIn(values))).get();
      final ids = tags.map((tag) => tag.id).toList(growable: false);
      if (ids.isEmpty) return;
      await (database.delete(
        database.linkTags,
      )..where((table) => table.tagId.isIn(ids))).go();
      await (database.delete(
        database.tags,
      )..where((table) => table.id.isIn(ids))).go();
    });
  }

  Future<void> deleteCollectionTags(Iterable<String> names) {
    final values = names.toSet();
    if (values.isEmpty) return Future.value();
    final database = settingsDatabase;
    return (database.update(
      database.collections,
    )..where((table) => table.tagName.isIn(values))).write(
      CollectionsCompanion(
        tagName: const Value(''),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  List<ManagedTag> _mapTags(List<QueryRow> rows) {
    return [
      for (final row in rows)
        ManagedTag(
          name: row.read<String>('name'),
          usageCount: row.read<int>('usage_count'),
        ),
    ];
  }
}
