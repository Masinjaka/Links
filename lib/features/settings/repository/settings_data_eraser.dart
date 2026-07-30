import 'package:linkvault/core/database/app_database.dart';

mixin SettingsDataEraser {
  AppDatabase get settingsDatabase;

  Future<void> eraseAllData() {
    final database = settingsDatabase;
    return database.transaction(() async {
      await database.delete(database.pendingTasks).go();
      await database.delete(database.bookmarkSnapshots).go();
      await database.delete(database.linkPreviews).go();
      await database.delete(database.collectionLinks).go();
      await database.delete(database.linkTags).go();
      await database.delete(database.links).go();
      await database.delete(database.collections).go();
      await database.delete(database.tags).go();
      await database.customStatement('DELETE FROM link_search');
    });
  }
}
