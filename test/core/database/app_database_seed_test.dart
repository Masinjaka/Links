import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linkvault/core/database/app_database.dart';

void main() {
  test('initializes the app without demo content', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    await database.seedIfEmpty();

    expect(await database.select(database.links).get(), isEmpty);
    expect(await database.select(database.tags).get(), isEmpty);
    expect(await database.select(database.collections).get(), isEmpty);
    expect(await database.select(database.profileMetrics).get(), isEmpty);

    final profile = await database.select(database.userProfiles).getSingle();
    expect(profile.linksSaved, 0);
    expect(profile.dataUsedMb, 0);
    expect(profile.storagePercent, 0);
    expect(await database.select(database.settingItems).get(), isNotEmpty);
    expect(await database.select(database.onboardingSteps).get(), isNotEmpty);
    expect(await database.select(database.browserPlatforms).get(), isNotEmpty);
  });
}
