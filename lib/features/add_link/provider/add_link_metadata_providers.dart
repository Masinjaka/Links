import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/add_link/repository/metadata_task_processor.dart';
import 'package:linkvault/features/add_link/service/metadata_task_runner.dart';

part 'add_link_metadata_providers.g.dart';

@Riverpod(keepAlive: true)
Dio addLinkDio(Ref ref) {
  return Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
      followRedirects: true,
      maxRedirects: 5,
      validateStatus: (status) => status != null && status < 500,
    ),
  );
}

@Riverpod(keepAlive: true)
AddLinkMetadataRepository addLinkMetadataRepository(Ref ref) {
  return DioAddLinkMetadataRepository(ref.watch(addLinkDioProvider));
}

@Riverpod(keepAlive: true)
MetadataTaskProcessor metadataTaskProcessor(Ref ref) {
  return MetadataTaskProcessor(
    ref.watch(appDatabaseProvider),
    ref.watch(addLinkMetadataRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
MetadataTaskRunner metadataTaskRunner(Ref ref) {
  final runner = MetadataTaskRunner(ref.watch(metadataTaskProcessorProvider));
  runner.start();
  ref.onDispose(runner.dispose);
  return runner;
}

@riverpod
class AddLinkUrlDraft extends _$AddLinkUrlDraft {
  @override
  String build() => '';

  void update(String value) {
    state = value;
  }
}

@riverpod
Future<AddLinkMetadata?> addLinkLivePreview(Ref ref) async {
  final rawUrl = ref.watch(addLinkUrlDraftProvider).trim();
  if (rawUrl.isEmpty) {
    return null;
  }

  await Future<void>.delayed(const Duration(milliseconds: 350));
  if (ref.read(addLinkUrlDraftProvider).trim() != rawUrl) {
    return null;
  }

  return ref.watch(addLinkMetadataRepositoryProvider).fetch(rawUrl);
}
