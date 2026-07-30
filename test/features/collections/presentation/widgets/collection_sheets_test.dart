import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/widgets/primary_add_button.dart';
import 'package:linkvault/features/collections/presentation/widget/collections_widgets.dart';
import 'package:linkvault/shared/presentation/widgets/library_bottom_sheet.dart';

import '../../../../support/linkvault_test_harness.dart';

void main() {
  testWidgets(
    'collection add action opens the redesigned sheet and tag picker',
    (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpLinkVault('/collections');

      await tester.tap(find.byType(PrimaryAddButton));
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('add-collection-sheet-surface')),
        findsOneWidget,
      );
      expect(find.text('NEW COLLECTION'), findsOneWidget);
      expect(find.text('Collection name'), findsOneWidget);
      expect(find.text('Icon'), findsOneWidget);
      expect(find.text('Add collection'), findsOneWidget);

      await tester.tap(find.byKey(const Key('collection-tag-picker-button')));
      await tester.pumpAndSettle();
      final tagSheet = find.byKey(const Key('add-link-tags-sheet'));
      expect(tagSheet, findsOneWidget);
      expect(
        find.descendant(of: tagSheet, matching: find.text('Utility')),
        findsOneWidget,
      );
    },
  );

  testWidgets('collection card opens the details bottom sheet', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/collections');

    await tester.tap(find.byType(CollectionFeedCard).first);
    await tester.pumpAndSettle();

    expect(
      find.byKey(const Key('collection-details-sheet-surface')),
      findsOneWidget,
    );
    expect(find.text('WORK PROJECTS'), findsOneWidget);
    final details = find.byKey(const Key('collection-details-sheet-surface'));
    expect(
      find.descendant(of: details, matching: find.text('Links')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('collection-details-add-link')),
      findsOneWidget,
    );
  });

  testWidgets('collection options open and edit returns to a sheet', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/collections');

    await tester.tap(find.byType(CollectionFeedCard).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('collection-options-button')));
    await tester.pumpAndSettle();

    final options = find.byKey(const Key('collection-options-sheet'));
    expect(options, findsOneWidget);
    expect(find.byType(LibraryBottomSheetSurface), findsOneWidget);
    for (final label in [
      'Edit',
      'Mark as favorite',
      'Pin',
      'Archive',
      'Delete',
    ]) {
      expect(
        find.descendant(of: options, matching: find.text(label)),
        findsOneWidget,
      );
    }

    await tester.tap(find.byKey(const ValueKey('collection-option-edit')));
    await tester.pumpAndSettle();
    expect(
      find.byKey(const Key('collection-details-sheet-surface')),
      findsNothing,
    );
    expect(
      find.byKey(const Key('add-collection-sheet-surface')),
      findsOneWidget,
    );
    expect(find.text('EDIT COLLECTION'), findsOneWidget);
  });

  testWidgets('add-link action opens the searchable multi-select sheet', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/collections');

    await tester.tap(find.byType(CollectionFeedCard).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('collection-details-add-link')));
    await tester.pumpAndSettle();

    expect(
      find.byKey(const Key('collection-link-picker-sheet')),
      findsOneWidget,
    );
    expect(find.text('Select links'), findsOneWidget);
    expect(find.text('Search link'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('collection-link-search')),
      'missing',
    );
    await tester.pump();
    expect(find.text('No available links'), findsOneWidget);
    await tester.enterText(
      find.byKey(const Key('collection-link-search')),
      'manifesto',
    );
    await tester.pump();

    await tester.tap(find.byKey(const ValueKey('collection-link-choice-1')));
    await tester.pump();
    expect(find.text('(1) Done'), findsOneWidget);

    await tester.tap(find.byKey(const Key('collection-link-picker-done')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('collection-link-picker-sheet')), findsNothing);
    expect(
      find.byKey(const Key('collection-details-sheet-surface')),
      findsOneWidget,
    );
  });
}
