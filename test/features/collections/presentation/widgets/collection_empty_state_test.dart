import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_details_body.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/l10n/app_localizations.dart';

void main() {
  testWidgets('empty collection details show the shared illustration', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final now = DateTime(2026, 7, 30);

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: CollectionDetailsBody(
            collection: CollectionWithCount(
              collection: Collection(
                id: 1,
                title: 'DEVELOPMENT',
                type: 'CUSTOM',
                iconKey: 'code',
                tagName: '',
                isFavourite: false,
                isPinned: false,
                isArchived: false,
                createdAt: now,
                updatedAt: now,
              ),
              count: 0,
            ),
            links: const [],
            sheetMode: true,
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byKey(const Key('collection-empty-state')), findsOneWidget);
    expect(find.byKey(const Key('library-empty-illustration')), findsOneWidget);
    expect(find.text('No links yet.'), findsOneWidget);
    expect(find.text('Start by adding some.'), findsOneWidget);
    expect(
      find.byKey(const Key('collection-details-add-link')),
      findsOneWidget,
    );
  });
}
