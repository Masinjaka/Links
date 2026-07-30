import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/linkvault_test_harness.dart';

void main() {
  testWidgets('erase data requires confirmation and executes once', (
    tester,
  ) async {
    await tester.pumpLinkVault('/settings');

    await tester.tap(find.byKey(const Key('settings-erase-data-row')));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.byKey(const Key('library-action-dialog')), findsOneWidget);
    expect(find.byType(BottomSheet), findsNothing);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Erase data'), findsNWidgets(3));
    expect(find.byType(FilledButton), findsNWidgets(2));
    expect(
      tester
          .getSize(find.byKey(const Key('library-action-dialog-content')))
          .height,
      lessThanOrEqualTo(300),
    );
    expect(
      tester.getSize(find.widgetWithText(FilledButton, 'Cancel')).height,
      40,
    );
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(settingsEraseCount, 0);

    await tester.tap(find.byKey(const Key('settings-erase-data-row')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirm-erase-data')));
    await tester.pumpAndSettle();
    expect(settingsEraseCount, 1);
    expect(find.text('All data erased'), findsOneWidget);
  });

  testWidgets('CSV import and export use the shared dialog design', (
    tester,
  ) async {
    await tester.pumpLinkVault('/settings');

    await tester.tap(find.byKey(const Key('settings-export-row')));
    await tester.pumpAndSettle();
    expect(find.text('Export CSV'), findsOneWidget);
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.byType(BottomSheet), findsNothing);
    expect(find.byKey(const Key('csv-export-content')), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('settings-import-row')));
    await tester.pumpAndSettle();
    expect(find.text('Import CSV'), findsNWidgets(2));
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.byType(BottomSheet), findsNothing);
    await tester.enterText(
      find.byKey(const Key('csv-import-field')),
      'url,title\nhttps://example.com,Example',
    );
    await tester.tap(find.byKey(const Key('confirm-csv-import')));
    await tester.pumpAndSettle();
    expect(lastImportedCsv, contains('https://example.com'));
  });
}
