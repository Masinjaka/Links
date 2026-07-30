import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/features/settings/repository/app_preference_store.dart';

void main() {
  test('preference providers restore and save persisted choices', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final store = DriftAppPreferenceStore(database);
    await store.writeString('theme', AppThemePreference.dark.name);
    await store.writeString('accent', AppAccentTone.purple.name);
    await store.writeString('language', AppLanguage.french.name);

    final container = ProviderContainer(
      overrides: [appPreferenceStoreProvider.overrideWithValue(store)],
    );
    addTearDown(container.dispose);
    container.read(selectedAppThemePreferenceProvider);
    container.read(selectedAccentToneProvider);
    container.read(selectedAppLanguageProvider);
    await pumpEventQueue();

    expect(
      container.read(selectedAppThemePreferenceProvider),
      AppThemePreference.dark,
    );
    expect(container.read(selectedAccentToneProvider), AppAccentTone.purple);
    expect(container.read(selectedAppLanguageProvider), AppLanguage.french);

    container
        .read(selectedAppThemePreferenceProvider.notifier)
        .select(AppThemePreference.system);
    container
        .read(selectedAccentToneProvider.notifier)
        .select(AppAccentTone.blue);
    container
        .read(selectedAppLanguageProvider.notifier)
        .select(AppLanguage.malagasy);
    await pumpEventQueue();
    expect(await store.readString('theme'), AppThemePreference.system.name);
    expect(await store.readString('accent'), AppAccentTone.blue.name);
    expect(await store.readString('language'), AppLanguage.malagasy.name);
  });
}
