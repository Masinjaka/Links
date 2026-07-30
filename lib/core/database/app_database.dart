import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';
part 'app_database_migrations.dart';
part 'app_database_search.dart';
part 'app_database_seed.dart';
part 'app_database_seed_data.dart';
part 'tables/bookmark_tables.dart';
part 'tables/library_tables.dart';
part 'tables/support_tables.dart';

@DriftDatabase(
  tables: [
    Links,
    LinkPreviews,
    Tags,
    LinkTags,
    Collections,
    CollectionLinks,
    BookmarkSnapshots,
    PendingTasks,
    UserProfiles,
    ProfileMetrics,
    SettingItems,
    OnboardingSteps,
    BrowserPlatforms,
  ],
)
final class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  AppDatabase.defaults() : super(driftDatabase(name: 'linkvault'));

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => buildMigrationStrategy(this);
}
