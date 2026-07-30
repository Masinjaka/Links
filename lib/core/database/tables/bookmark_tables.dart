part of '../app_database.dart';

class Links extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get url => text().unique()();
  TextColumn get originalUrl => text().withDefault(const Constant(''))();
  TextColumn get normalizedUrl => text().withDefault(const Constant(''))();
  TextColumn get canonicalUrl => text().nullable()();
  TextColumn get urlHash => text().withDefault(const Constant(''))();
  TextColumn get domain => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get note => text().withDefault(const Constant(''))();
  TextColumn get sourceImageUrl => text().nullable()();
  TextColumn get faviconUrl => text().nullable()();
  TextColumn get readingTime => text().withDefault(const Constant(''))();
  TextColumn get contentType => text().withDefault(const Constant('webpage'))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  BoolColumn get isFavourite => boolean().withDefault(const Constant(false))();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  TextColumn get metadataStatus =>
      text().withDefault(const Constant('pending'))();
  TextColumn get offlineStatus =>
      text().withDefault(const Constant('unavailable'))();
  TextColumn get linkHealthStatus =>
      text().withDefault(const Constant('unknown'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastOpenedAt => dateTime().nullable()();
  DateTimeColumn get archivedAt => dateTime().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  DateTimeColumn get metadataFetchedAt => dateTime().nullable()();
  DateTimeColumn get linkCheckedAt => dateTime().nullable()();
  IntColumn get manualSortOrder => integer().withDefault(const Constant(0))();
}

class LinkPreviews extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get linkId =>
      integer().references(Links, #id, onDelete: KeyAction.cascade).unique()();
  TextColumn get previewTitle => text()();
  TextColumn get previewDescription => text().withDefault(const Constant(''))();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get imageLabel =>
      text().withDefault(const Constant('SOURCE_PREVIEW.JPG'))();
  TextColumn get imageDimensions =>
      text().withDefault(const Constant('1240 x 800'))();
  DateTimeColumn get fetchedAt => dateTime().withDefault(currentDateAndTime)();
}

class BookmarkSnapshots extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookmarkId =>
      integer().references(Links, #id, onDelete: KeyAction.cascade).unique()();
  TextColumn get format => text()();
  TextColumn get localPath => text()();
  TextColumn get textContent => text().nullable()();
  TextColumn get checksum => text()();
  IntColumn get fileSize => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get lastError => text().nullable()();
}

class PendingTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookmarkId =>
      integer().references(Links, #id, onDelete: KeyAction.cascade)();
  TextColumn get taskType => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get attemptCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextRetryAt =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {bookmarkId, taskType},
  ];
}
