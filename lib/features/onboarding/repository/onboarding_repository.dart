import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';

class VaultOnboardingStep {
  const VaultOnboardingStep({
    required this.id,
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.iconKey,
    required this.showPlatforms,
  });

  final int id;
  final String stepNumber;
  final String title;
  final String description;
  final String iconKey;
  final bool showPlatforms;

  String get number => stepNumber;
}

class BrowserPlatformOption {
  const BrowserPlatformOption({
    required this.id,
    required this.name,
    required this.iconKey,
  });

  final int id;
  final String name;
  final String iconKey;
}

abstract interface class OnboardingRepository {
  Stream<List<VaultOnboardingStep>> watchOnboardingSteps();
  Stream<List<BrowserPlatformOption>> watchBrowserPlatforms();
}

class DriftOnboardingRepository implements OnboardingRepository {
  const DriftOnboardingRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<VaultOnboardingStep>> watchOnboardingSteps() {
    final query = _db.select(_db.onboardingSteps)
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.sortOrder)]);

    return query.watch().map((steps) {
      return [
        for (final step in steps)
          VaultOnboardingStep(
            id: step.id,
            stepNumber: step.stepNumber,
            title: step.title,
            description: step.description,
            iconKey: step.iconKey,
            showPlatforms: step.showPlatforms,
          ),
      ];
    });
  }

  @override
  Stream<List<BrowserPlatformOption>> watchBrowserPlatforms() {
    final query = _db.select(_db.browserPlatforms)
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.sortOrder)]);

    return query.watch().map((platforms) {
      return [
        for (final platform in platforms)
          BrowserPlatformOption(
            id: platform.id,
            name: platform.name,
            iconKey: platform.iconKey,
          ),
      ];
    });
  }
}
