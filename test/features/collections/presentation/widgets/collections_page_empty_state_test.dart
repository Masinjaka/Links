import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/collections/presentation/collections_page.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/l10n/app_localizations.dart';

void main() {
  testWidgets('collections page shows an illustration when its list is empty', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          visibleCollectionsProvider.overrideWithValue(const AsyncData([])),
          collectionFiltersProvider.overrideWithValue(
            const AsyncData([allCollectionsFilter]),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: CollectionsPage(),
        ),
      ),
    );
    await tester.pump();

    expect(find.byKey(const Key('collections-empty-state')), findsOneWidget);
    expect(find.byKey(const Key('library-empty-illustration')), findsOneWidget);
    expect(find.text('No collections yet.'), findsOneWidget);
    expect(find.text('Start by adding some.'), findsOneWidget);
  });
}
