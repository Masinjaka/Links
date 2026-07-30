import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';

class LinkMetadataWriter {
  const LinkMetadataWriter(this._db);

  final AppDatabase _db;

  Future<void> write(int id, AddLinkMetadata? metadata) async {
    if (metadata == null) return;
    await _db
        .into(_db.linkPreviews)
        .insert(
          LinkPreviewsCompanion.insert(
            linkId: id,
            previewTitle: metadata.title,
            previewDescription: Value(metadata.description),
            imageUrl: Value(metadata.imageUrl),
          ),
          mode: InsertMode.insertOrReplace,
        );
    await (_db.update(_db.links)..where((table) => table.id.equals(id))).write(
      LinksCompanion(
        title: Value(metadata.title),
        canonicalUrl: Value(metadata.canonicalUrl ?? metadata.url),
        domain: Value(metadata.host),
        description: Value(metadata.description),
        sourceImageUrl: Value(metadata.imageUrl),
        faviconUrl: Value(metadata.siteIconUrl),
        readingTime: Value(metadata.readingTime ?? ''),
        contentType: Value(metadata.contentType),
        metadataStatus: const Value('completed'),
        metadataFetchedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> queue(int id, DateTime now) {
    return _db
        .into(_db.pendingTasks)
        .insert(
          PendingTasksCompanion.insert(
            bookmarkId: id,
            taskType: 'fetchMetadata',
            nextRetryAt: Value(now),
          ),
          mode: InsertMode.insertOrIgnore,
        );
  }
}
