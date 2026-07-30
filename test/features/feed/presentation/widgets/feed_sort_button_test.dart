import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/feed/domain/bookmark_state.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_sort_button.dart';
import 'package:linkvault/shared/presentation/widgets/library_bottom_sheet.dart';

void main() {
  testWidgets('link sorting opens the reference bottom sheet', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    FeedSort? result;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FeedSortButton(
            selected: FeedSort.recentlyAdded,
            onSelected: (value) => result = value,
          ),
        ),
      ),
    );

    await tester.tap(find.byTooltip('sort links'));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('sort-bottom-sheet')), findsOneWidget);
    expect(find.byType(LibraryBottomSheetSurface), findsOneWidget);
    expect(find.text('Sort'), findsOneWidget);
    expect(find.text('Recently added'), findsOneWidget);
    expect(find.text('Manual order'), findsOneWidget);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    expect(
      tester.widget<Text>(find.text('Recently added')).style?.fontSize,
      13,
    );
    expect(
      tester.getBottomLeft(find.byKey(const Key('sort-bottom-sheet'))).dy,
      844,
    );
    final barrier = tester.widget<ModalBarrier>(
      find
          .byWidgetPredicate(
            (widget) => widget is ModalBarrier && widget.color != null,
          )
          .last,
    );
    expect(barrier.color!.a, closeTo(.36, .01));

    await tester.tap(find.text('Oldest'));
    await tester.pumpAndSettle();

    expect(result, FeedSort.oldest);
    expect(find.byKey(const Key('sort-bottom-sheet')), findsNothing);
  });
}
