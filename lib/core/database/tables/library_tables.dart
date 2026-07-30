part of '../app_database.dart';

class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get category => text().withDefault(const Constant('GENERAL'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class LinkTags extends Table {
  IntColumn get linkId =>
      integer().references(Links, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId =>
      integer().references(Tags, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {linkId, tagId};
}

class Collections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().unique()();
  TextColumn get type => text()();
  TextColumn get iconKey => text().withDefault(const Constant('folder'))();
  TextColumn get tagName => text().withDefault(const Constant(''))();
  BoolColumn get isFavourite => boolean().withDefault(const Constant(false))();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class CollectionLinks extends Table {
  IntColumn get collectionId =>
      integer().references(Collections, #id, onDelete: KeyAction.cascade)();
  IntColumn get linkId =>
      integer().references(Links, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {collectionId, linkId};
}
