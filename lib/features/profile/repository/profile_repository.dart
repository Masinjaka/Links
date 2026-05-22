import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';

class ProfileSnapshot {
  const ProfileSnapshot({required this.profile, required this.metrics});

  final UserProfile profile;
  final List<ProfileMetric> metrics;
}

abstract interface class ProfileRepository {
  Stream<ProfileSnapshot> watchProfile();
  Future<void> updateStoragePercent(double value);
}

class DriftProfileRepository implements ProfileRepository {
  const DriftProfileRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<ProfileSnapshot> watchProfile() {
    return _db.select(_db.userProfiles).watchSingle().asyncMap((profile) async {
      final metrics =
          await (_db.select(_db.profileMetrics)
                ..where((tbl) => tbl.profileId.equals(profile.id))
                ..orderBy([(tbl) => OrderingTerm.asc(tbl.sortOrder)]))
              .get();

      return ProfileSnapshot(profile: profile, metrics: metrics);
    });
  }

  @override
  Future<void> updateStoragePercent(double value) async {
    final profile = await _db.select(_db.userProfiles).getSingle();
    await (_db.update(
      _db.userProfiles,
    )..where((tbl) => tbl.id.equals(profile.id))).write(
      UserProfilesCompanion(
        storagePercent: Value(value.clamp(0, 1).toDouble()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
