import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/link_details/repository/link_details_repository.dart';

part 'link_details_providers.g.dart';

@Riverpod(keepAlive: true)
LinkDetailsRepository linkDetailsRepository(Ref ref) {
  return DriftLinkDetailsRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<LinkWithTags?> linkDetails(Ref ref, int? linkId) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(linkDetailsRepositoryProvider).watchLink(linkId);
}
