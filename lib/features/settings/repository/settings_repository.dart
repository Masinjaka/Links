import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/repository/link_repository_utils.dart';

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
  Future<int> importLinksCsv(String csvContent);
}

class DriftSettingsRepository implements SettingsRepository {
  const DriftSettingsRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<SettingOption>> watchSettings() {
    final query = _db.select(_db.settingItems)
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.sortOrder)]);

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
    return (_db.update(_db.settingItems)..where((tbl) => tbl.id.equals(id)))
        .write(SettingItemsCompanion(enabled: Value(enabled)));
  }

  @override
  Future<String> exportLinksCsv() async {
    final links = await (_db.select(
      _db.links,
    )..orderBy([(tbl) => OrderingTerm.asc(tbl.id)])).get();

    final rows = <String>['url,title,description,tags,is_archived'];

    for (final link in links) {
      final tagRows =
          await (_db.select(_db.linkTags).join([
                  innerJoin(
                    _db.tags,
                    _db.tags.id.equalsExp(_db.linkTags.tagId),
                  ),
                ])
                ..where(_db.linkTags.linkId.equals(link.id))
                ..orderBy([OrderingTerm.asc(_db.tags.name)]))
              .get();

      final tags = tagRows.map((row) => row.readTable(_db.tags).name).join('|');

      rows.add(
        [
          _csv(link.url),
          _csv(link.title),
          _csv(link.description),
          _csv(tags),
          _csv(link.isArchived ? 'true' : 'false'),
        ].join(','),
      );
    }

    return rows.join('\n');
  }

  @override
  Future<int> importLinksCsv(String csvContent) async {
    final rows = _parseCsv(csvContent);
    if (rows.length < 2) {
      return 0;
    }

    final header = rows.first
        .map((value) => value.trim().toLowerCase())
        .toList(growable: false);
    final urlIndex = header.indexOf('url');
    final titleIndex = header.indexOf('title');
    final descriptionIndex = header.indexOf('description');
    final tagsIndex = header.indexOf('tags');
    final archivedIndex = header.indexOf('is_archived');

    if (urlIndex == -1) {
      return 0;
    }

    var imported = 0;
    await _db.transaction(() async {
      for (final row in rows.skip(1)) {
        if (row.length <= urlIndex) {
          continue;
        }

        final rawUrl = row[urlIndex].trim();
        if (rawUrl.isEmpty) {
          continue;
        }

        final url = normalizeUrl(rawUrl);
        final parsedUrl = Uri.tryParse(url);
        final title = _valueAt(row, titleIndex);
        final description = _valueAt(row, descriptionIndex);
        final tags = (_valueAt(row, tagsIndex) ?? '')
            .split('|')
            .map((tag) => tag.trim().toUpperCase())
            .where((tag) => tag.isNotEmpty)
            .toList(growable: false);
        final archived =
            (_valueAt(row, archivedIndex) ?? '').toLowerCase() == 'true';

        final existing = await (_db.select(
          _db.links,
        )..where((tbl) => tbl.url.equals(url))).getSingleOrNull();

        final titleValue = title?.trim().isNotEmpty == true
            ? title!.trim()
            : (parsedUrl?.host.isNotEmpty == true
                  ? parsedUrl!.host.toUpperCase()
                  : 'IMPORTED_LINK');

        final linkId = existing == null
            ? await _db
                  .into(_db.links)
                  .insert(
                    LinksCompanion.insert(
                      title: titleValue,
                      url: url,
                      domain: parsedUrl?.host ?? 'local',
                      description: Value(description ?? ''),
                      readingTime: const Value(''),
                      isArchived: Value(archived),
                    ),
                  )
            : existing.id;

        if (existing != null) {
          await (_db.update(
            _db.links,
          )..where((tbl) => tbl.id.equals(linkId))).write(
            LinksCompanion(
              title: Value(titleValue),
              domain: Value(parsedUrl?.host ?? existing.domain),
              description: Value(description ?? existing.description),
              isArchived: Value(archived),
              updatedAt: Value(DateTime.now()),
            ),
          );
        }

        await (_db.delete(
          _db.linkTags,
        )..where((tbl) => tbl.linkId.equals(linkId))).go();

        for (final tag in tags) {
          final tagId = await _findOrCreateTagId(tag);
          await _db
              .into(_db.linkTags)
              .insert(
                LinkTagsCompanion.insert(linkId: linkId, tagId: tagId),
                mode: InsertMode.insertOrIgnore,
              );
        }

        imported += 1;
      }
    });

    return imported;
  }

  Future<int> _findOrCreateTagId(String name) async {
    final existing = await (_db.select(
      _db.tags,
    )..where((tbl) => tbl.name.equals(name))).getSingleOrNull();
    if (existing != null) {
      return existing.id;
    }

    await _db
        .into(_db.tags)
        .insert(
          TagsCompanion.insert(name: name),
          mode: InsertMode.insertOrIgnore,
        );

    final inserted = await (_db.select(
      _db.tags,
    )..where((tbl) => tbl.name.equals(name))).getSingle();

    return inserted.id;
  }

  String _csv(String value) {
    final escaped = value.replaceAll('"', '""');
    return '"$escaped"';
  }

  String? _valueAt(List<String> row, int index) {
    if (index < 0 || index >= row.length) {
      return null;
    }

    final value = row[index].trim();
    return value.isEmpty ? null : value;
  }

  List<List<String>> _parseCsv(String input) {
    final rows = <List<String>>[];
    final currentRow = <String>[];
    final currentValue = StringBuffer();
    var inQuotes = false;

    for (var i = 0; i < input.length; i++) {
      final char = input[i];
      final next = i + 1 < input.length ? input[i + 1] : null;

      if (char == '"') {
        if (inQuotes && next == '"') {
          currentValue.write('"');
          i += 1;
        } else {
          inQuotes = !inQuotes;
        }
        continue;
      }

      if (char == ',' && !inQuotes) {
        currentRow.add(currentValue.toString());
        currentValue.clear();
        continue;
      }

      if ((char == '\n' || char == '\r') && !inQuotes) {
        if (char == '\r' && next == '\n') {
          i += 1;
        }
        currentRow.add(currentValue.toString());
        currentValue.clear();
        if (currentRow.any((cell) => cell.isNotEmpty)) {
          rows.add(List<String>.from(currentRow));
        }
        currentRow.clear();
        continue;
      }

      currentValue.write(char);
    }

    if (currentValue.isNotEmpty || currentRow.isNotEmpty) {
      currentRow.add(currentValue.toString());
      if (currentRow.any((cell) => cell.isNotEmpty)) {
        rows.add(List<String>.from(currentRow));
      }
    }

    return rows;
  }
}
