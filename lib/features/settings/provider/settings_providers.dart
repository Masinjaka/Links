import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/settings/repository/settings_repository.dart';

part 'settings_providers.g.dart';

enum AppThemePreference { system, light, dark }

enum AppAccentTone {
  red(0xFFD90429),
  green(0xFF30D158),
  blue(0xFF0A84FF),
  orange(0xFFFF9F0A);

  const AppAccentTone(this.colorValue);

  final int colorValue;
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  return DriftSettingsRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<List<SettingOption>> settings(Ref ref) async* {
  await ref.watch(seedDatabaseProvider.future);
  yield* ref.watch(settingsRepositoryProvider).watchSettings();
}

@riverpod
Future<String> installedAppVersion(Ref ref) async {
  final info = await PackageInfo.fromPlatform();
  final buildNumber = info.buildNumber.trim();
  return buildNumber.isEmpty ? info.version : '${info.version}+$buildNumber';
}

@riverpod
class SelectedAppThemePreference extends _$SelectedAppThemePreference {
  @override
  AppThemePreference build() => AppThemePreference.system;

  void select(AppThemePreference value) {
    state = value;
  }
}

@riverpod
class SelectedAccentTone extends _$SelectedAccentTone {
  @override
  AppAccentTone build() => AppAccentTone.red;

  void select(AppAccentTone value) {
    state = value;
  }
}
