import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linkvault/app/widgets/primary_add_button.dart';

import '../support/linkvault_test_harness.dart';

void main() {
  testWidgets('settings add action expands and dismisses its menu', (
    tester,
  ) async {
    await tester.pumpLinkVault('/settings');

    await tester.tap(find.byType(PrimaryAddButton));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('primary-add-menu')), findsOneWidget);
    expect(find.text('Add link'), findsOneWidget);
    expect(find.text('Add collection'), findsOneWidget);

    await tester.tap(find.byType(PrimaryAddButton));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('primary-add-menu')), findsNothing);
  });

  testWidgets('settings menu opens the requested creation sheet', (
    tester,
  ) async {
    await tester.pumpLinkVault('/settings');

    await tester.tap(find.byType(PrimaryAddButton));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add collection'));
    await tester.pumpAndSettle();

    expect(
      find.byKey(const Key('add-collection-sheet-surface')),
      findsOneWidget,
    );
    expect(find.text('NEW COLLECTION'), findsOneWidget);
  });
}
