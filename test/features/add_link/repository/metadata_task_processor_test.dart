import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/add_link/repository/drift_add_link_repository.dart';
import 'package:linkvault/features/add_link/repository/metadata_task_processor.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

void main() {
  late AppDatabase database;
  late DriftAddLinkRepository addRepository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    addRepository = DriftAddLinkRepository(database);
  });

  tearDown(() => database.close());

  test('completes queued metadata and updates the bookmark', () async {
    final id = await addRepository.create(
      const LinkDraft(url: 'example.com/article'),
    );
    final queuedTask = await database.select(database.pendingTasks).getSingle();
    final now = queuedTask.nextRetryAt;
    final processor = MetadataTaskProcessor(
      database,
      _MetadataRepository(
        const AddLinkMetadata(
          url: 'https://example.com/article',
          host: 'example.com',
          title: 'Resolved title',
          description: 'Resolved description',
          canonicalUrl: 'https://example.com/canonical',
          contentType: 'webpage',
        ),
      ),
      now: () => now,
    );

    await processor.processDueTasks();

    final link = await (database.select(
      database.links,
    )..where((table) => table.id.equals(id))).getSingle();
    final task = await database.select(database.pendingTasks).getSingle();
    expect(link.title, 'Resolved title');
    expect(link.canonicalUrl, 'https://example.com/canonical');
    expect(link.metadataStatus, 'completed');
    expect(task.status, 'completed');
    expect(task.attemptCount, 1);
  });

  test('records failures with exponential retry time', () async {
    final id = await addRepository.create(
      const LinkDraft(url: 'example.com/offline'),
    );
    final queuedTask = await database.select(database.pendingTasks).getSingle();
    final now = queuedTask.nextRetryAt;
    final processor = MetadataTaskProcessor(
      database,
      _MetadataRepository.failure(),
      now: () => now,
    );

    await processor.processDueTasks();

    final link = await (database.select(
      database.links,
    )..where((table) => table.id.equals(id))).getSingle();
    final task = await database.select(database.pendingTasks).getSingle();
    expect(link.metadataStatus, 'failed');
    expect(task.status, 'failed');
    expect(task.attemptCount, 1);
    expect(task.nextRetryAt, now.add(const Duration(minutes: 2)));
    expect(task.lastError, contains('offline'));
  });
}

class _MetadataRepository implements AddLinkMetadataRepository {
  const _MetadataRepository(this.result) : error = null;

  const _MetadataRepository.failure() : result = null, error = 'offline';

  final AddLinkMetadata? result;
  final String? error;

  @override
  Future<AddLinkMetadata> fetch(String rawUrl) async {
    if (error != null) throw StateError(error!);
    return result!;
  }
}
