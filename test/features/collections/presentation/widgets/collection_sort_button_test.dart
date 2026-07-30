import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/collections/presentation/widget/collection_sort_button.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';

void main() {
  testWidgets('collection sorting uses the shared bottom sheet', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    CollectionSort? result;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CollectionSortButton(
            selected: CollectionSort.recentlyCreated,
            onSelected: (value) => result = value,
          ),
        ),
      ),
    );

    await tester.tap(find.byTooltip('sort collections'));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('sort-bottom-sheet')), findsOneWidget);
    expect(find.text('Recently created'), findsOneWidget);
    expect(find.text('Link count'), findsOneWidget);

    await tester.tap(find.text('Alphabetical'));
    await tester.pumpAndSettle();

    expect(result, CollectionSort.alphabetical);
  });
}
