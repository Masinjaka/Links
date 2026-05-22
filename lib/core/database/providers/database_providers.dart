import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/core/database/app_database.dart';

part 'database_providers.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase.defaults();
  ref.onDispose(database.close);
  return database;
}

@Riverpod(keepAlive: true)
Future<void> seedDatabase(Ref ref) async {
  await ref.watch(appDatabaseProvider).seedIfEmpty();
}
