import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/add_link/repository/link_metadata_writer.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

class MetadataTaskProcessor {
  MetadataTaskProcessor(
    this._db,
    this._metadataRepository, {
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now,
       _writer = LinkMetadataWriter(_db);

  final AppDatabase _db;
  final AddLinkMetadataRepository _metadataRepository;
  final LinkMetadataWriter _writer;
  final DateTime Function() _now;
  var _running = false;

  Future<void> processDueTasks({int limit = 5}) async {
    if (_running) return;
    _running = true;
    try {
      final now = _now();
      final query = _db.select(_db.pendingTasks)
        ..where(
          (table) =>
              table.taskType.equals('fetchMetadata') &
              table.status.isIn(['pending', 'failed']) &
              table.nextRetryAt.isSmallerOrEqualValue(now),
        )
        ..orderBy([(table) => OrderingTerm.asc(table.nextRetryAt)])
        ..limit(limit);
      for (final task in await query.get()) {
        await _process(task);
      }
    } finally {
      _running = false;
    }
  }

  Future<void> _process(PendingTask task) async {
    final now = _now();
    await _setFetching(task, now);
    final link = await (_db.select(
      _db.links,
    )..where((table) => table.id.equals(task.bookmarkId))).getSingleOrNull();
    if (link == null) return;

    try {
      final metadata = await _metadataRepository.fetch(link.displayUrl);
      await _db.transaction(() async {
        await _writer.write(link.id, metadata);
        await (_db.update(
          _db.pendingTasks,
        )..where((table) => table.id.equals(task.id))).write(
          PendingTasksCompanion(
            status: const Value('completed'),
            attemptCount: Value(task.attemptCount + 1),
            lastError: const Value(null),
            updatedAt: Value(_now()),
          ),
        );
        await _db.refreshSearchEntry(link.id);
      });
    } catch (error) {
      await _recordFailure(task, error);
    }
  }

  Future<void> _setFetching(PendingTask task, DateTime now) async {
    await _db.transaction(() async {
      await (_db.update(
        _db.pendingTasks,
      )..where((table) => table.id.equals(task.id))).write(
        PendingTasksCompanion(
          status: const Value('running'),
          updatedAt: Value(now),
        ),
      );
      await (_db.update(_db.links)
            ..where((table) => table.id.equals(task.bookmarkId)))
          .write(const LinksCompanion(metadataStatus: Value('fetching')));
    });
  }

  Future<void> _recordFailure(PendingTask task, Object error) async {
    final attempts = task.attemptCount + 1;
    final retryAt = _now().add(_backoff(attempts));
    await _db.transaction(() async {
      await (_db.update(
        _db.pendingTasks,
      )..where((table) => table.id.equals(task.id))).write(
        PendingTasksCompanion(
          status: const Value('failed'),
          attemptCount: Value(attempts),
          nextRetryAt: Value(retryAt),
          lastError: Value(error.toString()),
          updatedAt: Value(_now()),
        ),
      );
      await (_db.update(_db.links)
            ..where((table) => table.id.equals(task.bookmarkId)))
          .write(const LinksCompanion(metadataStatus: Value('failed')));
    });
  }

  Duration _backoff(int attempts) {
    final exponent = attempts.clamp(1, 8);
    return Duration(minutes: 1 << exponent);
  }
}
