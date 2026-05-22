import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/onboarding/repository/onboarding_repository.dart';

part 'onboarding_providers.g.dart';

@Riverpod(keepAlive: true)
OnboardingRepository onboardingRepository(Ref ref) {
  return DriftOnboardingRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<List<VaultOnboardingStep>> onboardingSteps(Ref ref) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(onboardingRepositoryProvider).watchOnboardingSteps();
}

@riverpod
Stream<List<BrowserPlatformOption>> browserPlatforms(Ref ref) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(onboardingRepositoryProvider).watchBrowserPlatforms();
}
