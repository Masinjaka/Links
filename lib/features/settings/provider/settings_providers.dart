import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/settings/repository/app_preference_store.dart';
import 'package:linkvault/features/settings/repository/settings_repository.dart';
import 'package:linkvault/features/settings/service/csv_file_saver.dart';

part 'settings_providers.g.dart';

enum AppThemePreference { system, light, dark }

enum AppAccentTone {
  red(0xFFFF6262),
  green(0xFF30D158),
  blue(0xFF0A84FF),
  purple(0xFF9568F5);

  const AppAccentTone(this.colorValue);

  final int colorValue;
}

enum AppLanguage {
  malagasy('mg'),
  french('fr'),
  english('en');

  const AppLanguage(this.localeCode);

  final String localeCode;
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  return DriftSettingsRepository(ref.watch(appDatabaseProvider));
}

@Riverpod(keepAlive: true)
CsvFileSaver csvFileSaver(Ref ref) {
  return const SystemCsvFileSaver();
}

@Riverpod(keepAlive: true)
AppPreferenceStore appPreferenceStore(Ref ref) {
  return DriftAppPreferenceStore(ref.watch(appDatabaseProvider));
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

@Riverpod(keepAlive: true)
class SelectedAppThemePreference extends _$SelectedAppThemePreference {
  static const _key = 'theme';
  var _selectedLocally = false;

  @override
  AppThemePreference build() {
    unawaited(_restore());
    return AppThemePreference.light;
  }

  void select(AppThemePreference value) {
    _selectedLocally = true;
    state = value;
    unawaited(
      ref.read(appPreferenceStoreProvider).writeString(_key, value.name),
    );
  }

  Future<void> _restore() async {
    final stored = await ref.read(appPreferenceStoreProvider).readString(_key);
    if (_selectedLocally || stored == null) return;
    state = _enumValue(AppThemePreference.values, stored, state);
  }
}

@Riverpod(keepAlive: true)
class SelectedAccentTone extends _$SelectedAccentTone {
  static const _key = 'accent';
  var _selectedLocally = false;

  @override
  AppAccentTone build() {
    unawaited(_restore());
    return AppAccentTone.red;
  }

  void select(AppAccentTone value) {
    _selectedLocally = true;
    state = value;
    unawaited(
      ref.read(appPreferenceStoreProvider).writeString(_key, value.name),
    );
  }

  Future<void> _restore() async {
    final stored = await ref.read(appPreferenceStoreProvider).readString(_key);
    if (_selectedLocally || stored == null) return;
    state = _enumValue(AppAccentTone.values, stored, state);
  }
}

@Riverpod(keepAlive: true)
class SelectedAppLanguage extends _$SelectedAppLanguage {
  static const _key = 'language';
  var _selectedLocally = false;

  @override
  AppLanguage build() {
    unawaited(_restore());
    return AppLanguage.english;
  }

  void select(AppLanguage value) {
    _selectedLocally = true;
    state = value;
    unawaited(
      ref.read(appPreferenceStoreProvider).writeString(_key, value.name),
    );
  }

  Future<void> _restore() async {
    final stored = await ref.read(appPreferenceStoreProvider).readString(_key);
    if (_selectedLocally || stored == null) return;
    state = _enumValue(AppLanguage.values, stored, state);
  }
}

T _enumValue<T extends Enum>(List<T> values, String name, T fallback) {
  return values.where((value) => value.name == name).firstOrNull ?? fallback;
}
