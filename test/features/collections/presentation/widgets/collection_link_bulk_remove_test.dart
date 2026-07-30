import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/collections/presentation/widget/collections_widgets.dart';

import '../../../../support/linkvault_test_harness.dart';

void main() {
  testWidgets('collection options enable multi-select and bulk removal', (
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

    expect(find.text('Select links'), findsOneWidget);
    await tester.tap(
      find.byKey(const ValueKey('collection-option-selectLinks')),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 80));

    final selectAll = find.byKey(const Key('collection-link-select-all'));
    expect(selectAll, findsOneWidget);
    final appearingFade = tester.widget<FadeTransition>(
      find.ancestor(of: selectAll, matching: find.byType(FadeTransition)),
    );
    expect(appearingFade.opacity.value, greaterThan(0));
    expect(appearingFade.opacity.value, lessThan(1));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('collection-details-add-link')), findsNothing);

    await tester.tap(find.byKey(const ValueKey('collection-detail-link-1')));
    await tester.tap(find.byKey(const ValueKey('collection-detail-link-2')));
    await tester.pump();

    final removeButton = find.byKey(const Key('selection-action-0'));
    expect(removeButton, findsOneWidget);
    await tester.tap(removeButton);
    await tester.pump();

    expect(removedCollectionLinkIds.toSet(), {1, 2});
    expect(find.byKey(const Key('collection-link-select-all')), findsOneWidget);
    expect(removeButton, findsNothing);

    await tester.tap(find.text('Cancel'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 70));
    expect(selectAll, findsOneWidget);
    final dismissingFade = tester.widget<FadeTransition>(
      find.ancestor(of: selectAll, matching: find.byType(FadeTransition)),
    );
    expect(dismissingFade.opacity.value, greaterThan(0));
    expect(dismissingFade.opacity.value, lessThan(1));
    await tester.pumpAndSettle();
    expect(selectAll, findsNothing);
  });
}
