import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/widgets/primary_add_button.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_icon_catalog.dart';

import '../../../../support/linkvault_test_harness.dart';

void main() {
  testWidgets('icon selector uses a searchable compact bottom sheet', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/collections');

    await tester.tap(find.byType(PrimaryAddButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('collection-icon-selector')));
    await tester.pumpAndSettle();

    expect(
      find.byKey(const Key('collection-icon-picker-sheet')),
      findsOneWidget,
    );
    expect(find.text('Select icons'), findsOneWidget);
    expect(find.text('Search icon'), findsOneWidget);
    expect(find.text('GENERAL'), findsNothing);
    expect(collectionIconOptions.length, greaterThanOrEqualTo(60));

    final folder = tester.widget<Icon>(
      find.byKey(const ValueKey('collection-icon-glyph-folder')),
    );
    expect(folder.size, 22);
    expect(folder.color, isNot(Colors.black));

    await tester.enterText(
      find.byKey(const Key('collection-icon-search')),
      'design',
    );
    await tester.pump();
    expect(
      find.byKey(const ValueKey('collection-icon-option-palette')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('collection-icon-option-folder')),
      findsNothing,
    );

    await tester.tap(
      find.byKey(const ValueKey('collection-icon-option-palette')),
    );
    await tester.tap(find.byKey(const Key('collection-icon-picker-done')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('collection-icon-picker-sheet')), findsNothing);
    expect(
      find.byKey(const ValueKey('selected-collection-icon-palette')),
      findsOneWidget,
    );
  });
}
