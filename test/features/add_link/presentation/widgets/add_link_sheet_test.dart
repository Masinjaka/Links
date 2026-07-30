import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/widgets/primary_add_button.dart';

import '../../../../support/linkvault_test_harness.dart';

void main() {
  testWidgets('primary add action opens the new-link modal sheet', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/');

    await tester.tap(find.byType(PrimaryAddButton));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('add-link-sheet-surface')), findsOneWidget);
    expect(find.text('NEW LINK'), findsOneWidget);
    expect(find.byTooltip('Close'), findsOneWidget);
    expect(find.text('Collection'), findsOneWidget);
    expect(find.text('Tags'), findsOneWidget);
  });

  testWidgets('sheet starts below the iPhone top safe area', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(top: 47);
    tester.view.viewPadding = const FakeViewPadding(top: 47);
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/');

    await tester.tap(find.byType(PrimaryAddButton));
    await tester.pumpAndSettle();

    final sheet = tester.getRect(
      find.byKey(const Key('add-link-sheet-surface')),
    );
    expect(sheet.top, greaterThan(47));
    expect(sheet.top, closeTo(54.2, 1));
  });

  testWidgets('collection row selects an available collection', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/');

    await tester.tap(find.byType(PrimaryAddButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('add-link-collection-selector')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('add-link-collection-sheet')), findsOneWidget);
    expect(find.text('Select collection'), findsOneWidget);
    expect(find.text('Work projects'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('add-link-collection-1')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('add-link-collection-done')));
    await tester.pumpAndSettle();

    expect(find.text('Work projects'), findsOneWidget);
  });
}
