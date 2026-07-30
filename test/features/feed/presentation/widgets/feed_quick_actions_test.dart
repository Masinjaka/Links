import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/feed/presentation/widgets/quick_action_widget.dart';

void main() {
  testWidgets('filled bulk actions allow unfavourite and unpin', (
    tester,
  ) async {
    var favouriteTapped = false;
    var pinTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              FeedQuickActions(
                favouriteActive: true,
                pinActive: true,
                onFavourite: () => favouriteTapped = true,
                onPin: () => pinTapped = true,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
    expect(find.byIcon(Icons.push_pin_rounded), findsOneWidget);
    expect(find.byIcon(Icons.favorite_outline_rounded), findsNothing);
    expect(find.byIcon(Icons.push_pin_outlined), findsNothing);

    await tester.tap(find.byKey(const Key('selection-action-0')));
    await tester.tap(find.byKey(const Key('selection-action-1')));

    expect(favouriteTapped, isTrue);
    expect(pinTapped, isTrue);
  });

  testWidgets('mixed bulk actions remain outlined', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [FeedQuickActions(onFavourite: () {}, onPin: () {})],
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.favorite_outline_rounded), findsOneWidget);
    expect(find.byIcon(Icons.push_pin_outlined), findsOneWidget);
  });
}
