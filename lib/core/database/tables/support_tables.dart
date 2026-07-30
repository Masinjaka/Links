part of '../app_database.dart';

class UserProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get displayName =>
      text().withDefault(const Constant('USER_CORE'))();
  TextColumn get authLevel =>
      text().withDefault(const Constant('AUTH_LEVEL_01'))();
  IntColumn get linksSaved => integer().withDefault(const Constant(1284))();
  RealColumn get dataUsedMb => real().withDefault(const Constant(42.8))();
  RealColumn get storagePercent => real().withDefault(const Constant(.68))();
  TextColumn get version =>
      text().withDefault(const Constant('LINKVAULT_OS v2.4.0-STABLE'))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class ProfileMetrics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId =>
      integer().references(UserProfiles, #id, onDelete: KeyAction.cascade)();
  TextColumn get label => text()();
  RealColumn get value => real()();
  IntColumn get sortOrder => integer()();
}

class SettingItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get section => text()();
  TextColumn get title => text()();
  TextColumn get subtitle => text().withDefault(const Constant(''))();
  TextColumn get kind => text().withDefault(const Constant('row'))();
  TextColumn get iconKey => text().withDefault(const Constant('settings'))();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  IntColumn get sortOrder => integer()();
}

class OnboardingSteps extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get stepNumber => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get iconKey => text()();
  BoolColumn get showPlatforms =>
      boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer()();
}

class BrowserPlatforms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get iconKey => text().withDefault(const Constant('public'))();
  IntColumn get sortOrder => integer()();
}
