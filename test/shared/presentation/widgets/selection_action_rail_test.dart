import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/shared/presentation/widgets/selection_action_rail.dart';

void main() {
  testWidgets('selection actions form the reference vertical circle rail', (
    tester,
  ) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              SelectionActionRail(
                actions: [
                  (
                    'favourite',
                    Icons.favorite_outline_rounded,
                    () {
                      tapped = true;
                    },
                  ),
                  ('pin', Icons.push_pin_outlined, () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    expect(
      tester.getSize(find.byKey(const Key('selection-action-0'))),
      const Size(52, 52),
    );
    expect(
      tester.getSize(find.byKey(const Key('selection-action-1'))),
      const Size(52, 52),
    );

    await tester.tap(find.byKey(const Key('selection-action-0')));
    expect(tapped, isTrue);
  });
}
