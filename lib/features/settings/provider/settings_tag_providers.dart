import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/features/settings/repository/managed_tag.dart';

final managedLinkTagsProvider = StreamProvider.autoDispose<List<ManagedTag>>((
  ref,
) {
  return ref.watch(settingsRepositoryProvider).watchLinkTags();
});

final managedCollectionTagsProvider =
    StreamProvider.autoDispose<List<ManagedTag>>((ref) {
      return ref.watch(settingsRepositoryProvider).watchCollectionTags();
    });
