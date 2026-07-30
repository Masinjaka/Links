import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/settings/repository/settings_csv_parser.dart';

mixin SettingsCsvExporter {
  AppDatabase get settingsDatabase;

  Future<String> exportLinksCsv() async {
    final database = settingsDatabase;
    final links = await (database.select(
      database.links,
    )..orderBy([(table) => OrderingTerm.asc(table.id)])).get();
    final rows = <String>['url,title,description,tags,is_archived'];

    for (final link in links) {
      final tagRows =
          await (database.select(database.linkTags).join([
                  innerJoin(
                    database.tags,
                    database.tags.id.equalsExp(database.linkTags.tagId),
                  ),
                ])
                ..where(database.linkTags.linkId.equals(link.id))
                ..orderBy([OrderingTerm.asc(database.tags.name)]))
              .get();
      final tags = tagRows
          .map((row) => row.readTable(database.tags).name)
          .join('|');
      rows.add(
        [
          escapeSettingsCsv(link.url),
          escapeSettingsCsv(link.title),
          escapeSettingsCsv(link.description),
          escapeSettingsCsv(tags),
          escapeSettingsCsv(link.isArchived ? 'true' : 'false'),
        ].join(','),
      );
    }
    return rows.join('\n');
  }
}
