import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/repository/link_repository_utils.dart';
import 'package:linkvault/features/settings/repository/settings_csv_parser.dart';

mixin SettingsCsvImporter {
  AppDatabase get settingsDatabase;

  Future<int> importLinksCsv(String csvContent) async {
    final rows = parseSettingsCsv(csvContent);
    if (rows.length < 2) return 0;
    final header = rows.first
        .map((value) => value.trim().toLowerCase())
        .toList(growable: false);
    final urlIndex = header.indexOf('url');
    if (urlIndex == -1) return 0;
    final titleIndex = header.indexOf('title');
    final descriptionIndex = header.indexOf('description');
    final tagsIndex = header.indexOf('tags');
    final archivedIndex = header.indexOf('is_archived');
    var imported = 0;

    await settingsDatabase.transaction(() async {
      for (final row in rows.skip(1)) {
        if (row.length <= urlIndex || row[urlIndex].trim().isEmpty) continue;
        await _importRow(
          row,
          urlIndex: urlIndex,
          titleIndex: titleIndex,
          descriptionIndex: descriptionIndex,
          tagsIndex: tagsIndex,
          archivedIndex: archivedIndex,
        );
        imported += 1;
      }
    });
    return imported;
  }

  Future<void> _importRow(
    List<String> row, {
    required int urlIndex,
    required int titleIndex,
    required int descriptionIndex,
    required int tagsIndex,
    required int archivedIndex,
  }) async {
    final database = settingsDatabase;
    final url = normalizeUrl(row[urlIndex].trim());
    final parsedUrl = Uri.tryParse(url);
    final title = settingsCsvValueAt(row, titleIndex);
    final description = settingsCsvValueAt(row, descriptionIndex);
    final tags = (settingsCsvValueAt(row, tagsIndex) ?? '')
        .split('|')
        .map((tag) => tag.trim().toUpperCase())
        .where((tag) => tag.isNotEmpty)
        .toList(growable: false);
    final archived =
        (settingsCsvValueAt(row, archivedIndex) ?? '').toLowerCase() == 'true';
    final existing = await (database.select(
      database.links,
    )..where((table) => table.url.equals(url))).getSingleOrNull();
    final titleValue = title?.trim().isNotEmpty == true
        ? title!.trim()
        : parsedUrl?.host.isNotEmpty == true
        ? parsedUrl!.host.toUpperCase()
        : 'IMPORTED_LINK';
    final linkId =
        existing?.id ??
        await _insertLink(
          title: titleValue,
          url: url,
          domain: parsedUrl?.host ?? 'local',
          description: description ?? '',
          archived: archived,
        );
    if (existing != null) {
      await (database.update(
        database.links,
      )..where((table) => table.id.equals(linkId))).write(
        LinksCompanion(
          title: Value(titleValue),
          domain: Value(parsedUrl?.host ?? existing.domain),
          description: Value(description ?? existing.description),
          isArchived: Value(archived),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
    await (database.delete(
      database.linkTags,
    )..where((table) => table.linkId.equals(linkId))).go();
    for (final tag in tags) {
      final tagId = await _findOrCreateTagId(tag);
      await database
          .into(database.linkTags)
          .insert(
            LinkTagsCompanion.insert(linkId: linkId, tagId: tagId),
            mode: InsertMode.insertOrIgnore,
          );
    }
  }

  Future<int> _insertLink({
    required String title,
    required String url,
    required String domain,
    required String description,
    required bool archived,
  }) {
    return settingsDatabase
        .into(settingsDatabase.links)
        .insert(
          LinksCompanion.insert(
            title: title,
            url: url,
            domain: domain,
            description: Value(description),
            readingTime: const Value(''),
            isArchived: Value(archived),
          ),
        );
  }

  Future<int> _findOrCreateTagId(String name) async {
    final database = settingsDatabase;
    final existing = await (database.select(
      database.tags,
    )..where((table) => table.name.equals(name))).getSingleOrNull();
    if (existing != null) return existing.id;
    await database
        .into(database.tags)
        .insert(
          TagsCompanion.insert(name: name),
          mode: InsertMode.insertOrIgnore,
        );
    return (database.select(database.tags)
          ..where((table) => table.name.equals(name)))
        .getSingle()
        .then((tag) => tag.id);
  }
}
