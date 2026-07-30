import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/collections/presentation/widget/collections_widgets.dart';
import 'package:linkvault/features/feed/presentation/widgets/kinetic_link_card.dart';
import 'package:linkvault/shared/presentation/widgets/library_bottom_sheet.dart';

import '../../../../support/linkvault_test_harness.dart';

void main() {
  testWidgets('feed card opens the redesigned link details sheet', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/');

    await tester.tap(find.byType(KineticLinkCard).first);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('link-details-sheet-surface')), findsOneWidget);
    expect(find.text('LINK DETAILS'), findsOneWidget);
    expect(find.text('Summary'), findsOneWidget);
    expect(find.text('Collection'), findsOneWidget);
    expect(find.text('Note'), findsOneWidget);
    expect(find.text('Tags'), findsOneWidget);
    expect(find.text('Open link'), findsOneWidget);
  });

  testWidgets('three-dot action opens the link options sheet', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/');

    await tester.tap(find.byType(KineticLinkCard).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('link-options-button')));
    await tester.pumpAndSettle();

    final optionsSheet = find.byKey(const Key('link-options-sheet'));
    expect(optionsSheet, findsOneWidget);
    expect(find.byType(LibraryBottomSheetSurface), findsOneWidget);
    for (final label in [
      'Edit',
      'Share',
      'Mark as favorite',
      'Pin',
      'Archive',
      'Delete',
    ]) {
      expect(
        find.descendant(of: optionsSheet, matching: find.text(label)),
        findsOneWidget,
      );
    }
  });

  testWidgets('edit replaces details with the add-link editing sheet', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/');

    await tester.tap(find.byType(KineticLinkCard).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('link-options-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('link-option-edit')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('link-details-sheet-surface')), findsNothing);
    expect(find.byKey(const Key('add-link-sheet-surface')), findsOneWidget);
    expect(find.text('EDIT LINK'), findsOneWidget);
  });

  testWidgets('collection links use the same link-details sheet inset', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    const surfaceKey = Key('link-details-sheet-surface');

    await tester.pumpLinkVault('/');
    await tester.tap(find.byType(KineticLinkCard).first);
    await tester.pumpAndSettle();
    final feedSheetTop = tester.getTopLeft(find.byKey(surfaceKey)).dy;
    await tester.tap(find.byKey(const Key('link-details-close')));
    await tester.pumpAndSettle();

    await tester.pumpLinkVault('/collections');
    await tester.tap(find.byType(CollectionFeedCard).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('collection-detail-link-1')));
    await tester.pumpAndSettle();

    final collectionSheet = find.byKey(surfaceKey);
    expect(collectionSheet, findsOneWidget);
    expect(tester.getTopLeft(collectionSheet).dy, feedSheetTop);
    expect(find.text('LINK DETAILS'), findsOneWidget);
  });
}
