import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/profile/repository/profile_repository.dart';

part 'profile_providers.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) {
  return DriftProfileRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<ProfileSnapshot> profile(Ref ref) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(profileRepositoryProvider).watchProfile();
}
