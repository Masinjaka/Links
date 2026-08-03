import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/feed/presentation/widgets/feed_selection_checkbox.dart';
import 'package:linkvault/features/feed/presentation/widgets/filter_chip_widget.dart';

import '../../../support/linkvault_test_harness.dart';

void main() {
  testWidgets('archived sheet is inset and animates both library tabs', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(top: 47);
    tester.view.viewPadding = const FakeViewPadding(top: 47);
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/settings');
    await tester.tap(find.byKey(const Key('settings-archived-row')));
    await tester.pumpAndSettle();

    final sheet = find.byKey(const Key('archived-library-sheet'));
    expect(sheet, findsOneWidget);
    expect(tester.getTopLeft(sheet).dy, closeTo(54.2, 1));
    expect(find.byKey(const Key('archived-tab-links')), findsOneWidget);
    expect(find.byKey(const Key('archived-tab-collections')), findsOneWidget);
    expect(
      find.byKey(const ValueKey('archived-collection-1-false')),
      findsOneWidget,
    );
    expect(find.byType(Animate), findsWidgets);

    await tester.tap(find.byKey(const Key('archived-tab-links')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('archived-link-1-false')), findsOneWidget);
    expect(find.byType(Animate), findsWidgets);
  });

  testWidgets('archived collections can be restored in selection mode', (
    tester,
  ) async {
    await _openArchivedSheet(tester);

    await tester.tap(find.byTooltip('select multiple'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('archived-collection-1-true')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('selection-action-0')));
    await tester.pumpAndSettle();

    expect(restoredArchivedCollectionIds, [1]);
    expect(find.text('Cancel'), findsOneWidget);
  });

  testWidgets('archived links can be permanently deleted in selection mode', (
    tester,
  ) async {
    await _openArchivedSheet(tester);
    await tester.tap(find.byKey(const Key('archived-tab-links')));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('select multiple'));
    await tester.pumpAndSettle();
    expect(find.byType(FeedSelectionCheckbox), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('archived-link-1-true')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('selection-action-1')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirm-permanent-delete')));
    await tester.pumpAndSettle();

    expect(deletedArchivedLinkIds, [1]);
  });

  testWidgets('main pages never expose archive or trash filters', (
    tester,
  ) async {
    await tester.pumpLinkVault('/');
    expect(find.widgetWithText(FeedFilterChip, 'Archive'), findsNothing);
    expect(find.widgetWithText(FeedFilterChip, 'Archived'), findsNothing);
    expect(find.widgetWithText(FeedFilterChip, 'Trash'), findsNothing);

    await tester.pumpLinkVault('/collections');
    expect(find.widgetWithText(FeedFilterChip, 'Archive'), findsNothing);
    expect(find.widgetWithText(FeedFilterChip, 'Archived'), findsNothing);
  });

  testWidgets('archived cards open inset detail sheets below the safe area', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(top: 47);
    tester.view.viewPadding = const FakeViewPadding(top: 47);
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/settings');
    await tester.tap(find.byKey(const Key('settings-archived-row')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('archived-collection-1-false')));
    await tester.pumpAndSettle();
    final collectionTop = tester
        .getTopLeft(find.byKey(const Key('collection-details-sheet-surface')))
        .dy;
    expect(collectionTop, greaterThan(40));
    await tester.tap(find.byKey(const Key('collection-details-close')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('archived-tab-links')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('archived-link-1-false')));
    await tester.pumpAndSettle();
    final linkTop = tester
        .getTopLeft(find.byKey(const Key('link-details-sheet-surface')))
        .dy;
    expect(linkTop, collectionTop);
    expect(linkTop, greaterThan(40));
  });
}

Future<void> _openArchivedSheet(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpLinkVault('/settings');
  await tester.tap(find.byKey(const Key('settings-archived-row')));
  await tester.pumpAndSettle();
}
