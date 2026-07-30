import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/feed/presentation/widgets/feed_selection_checkbox.dart';

import '../../../support/linkvault_test_harness.dart';

void main() {
  testWidgets('tags setting opens the inset animated tag library', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(top: 47);
    tester.view.viewPadding = const FakeViewPadding(top: 47);
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/settings');

    await tester.tap(find.byKey(const Key('settings-tags-row')));
    await tester.pumpAndSettle();

    final sheet = find.byKey(const Key('tags-library-sheet'));
    expect(sheet, findsOneWidget);
    expect(tester.getTopLeft(sheet).dy, closeTo(54.2, 1));
    expect(find.byKey(const Key('tags-tab-links')), findsOneWidget);
    expect(find.byKey(const Key('tags-tab-collections')), findsOneWidget);
    expect(find.byKey(const ValueKey('managed-tag-DESIGN')), findsOneWidget);
    expect(find.byType(Animate), findsWidgets);

    await tester.tap(find.byKey(const Key('tags-tab-collections')));
    await tester.pumpAndSettle();
    expect(
      find.byKey(const ValueKey('managed-tag-DEVELOPMENT')),
      findsOneWidget,
    );
  });

  testWidgets('link tags can be selected and bulk deleted', (tester) async {
    await _openTagsSheet(tester);

    await tester.tap(find.byKey(const Key('tags-start-selection')));
    await tester.pumpAndSettle();
    expect(find.byType(FeedSelectionCheckbox), findsNWidgets(2));
    await tester.tap(find.byKey(const ValueKey('managed-tag-DESIGN')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('selection-action-0')));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    await tester.tap(find.byKey(const Key('confirm-delete-tags')));
    await tester.pumpAndSettle();

    expect(deletedManagedLinkTags, ['DESIGN']);
  });

  testWidgets('collection tags support select-all and bulk delete', (
    tester,
  ) async {
    await _openTagsSheet(tester);
    await tester.tap(find.byKey(const Key('tags-tab-collections')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('tags-start-selection')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Select all'));
    await tester.pump();
    await tester.tap(find.byKey(const Key('selection-action-0')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirm-delete-tags')));
    await tester.pumpAndSettle();

    expect(deletedManagedCollectionTags, containsAll(['DEVELOPMENT', 'WORK']));
  });
}

Future<void> _openTagsSheet(WidgetTester tester) async {
  await tester.pumpLinkVault('/settings');
  await tester.tap(find.byKey(const Key('settings-tags-row')));
  await tester.pumpAndSettle();
}
