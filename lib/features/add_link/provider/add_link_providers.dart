import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/add_link/repository/add_link_repository.dart';
import 'package:linkvault/features/add_link/repository/drift_add_link_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

part 'add_link_providers.g.dart';

@Riverpod(keepAlive: true)
AddLinkRepository addLinkRepository(Ref ref) {
  return DriftAddLinkRepository(ref.watch(appDatabaseProvider));
}

@Riverpod(keepAlive: true)
class AddLinkOptimisticTags extends _$AddLinkOptimisticTags {
  @override
  Set<String> build() => <String>{};

  void add(String tag) {
    state = {...state, tag};
  }

  void removeAll(Iterable<String> tags) {
    state = {...state}..removeAll(tags);
  }
}

@riverpod
Stream<List<String>> addLinkAvailableTags(Ref ref) async* {
  final optimisticTags = ref.watch(addLinkOptimisticTagsProvider);
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(addLinkRepositoryProvider).watchTags().map((tags) {
    final values = <String>[for (final tag in tags) tag.name, ...optimisticTags]
      ..sort();

    return values.toSet().toList(growable: false);
  });
}

@riverpod
Stream<LinkWithTags?> addLinkEditingLink(Ref ref, int? linkId) async* {
  if (linkId == null) {
    yield null;
    return;
  }

  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(addLinkRepositoryProvider).watchLink(linkId);
}
