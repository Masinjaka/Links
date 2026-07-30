import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/add_link/presentation/widget/add_link_scaffold.dart';

void main() {
  testWidgets('bottom action remains fixed while form content scrolls', (
    tester,
  ) async {
    const actionKey = Key('bottom-action');

    await tester.pumpWidget(
      const MaterialApp(
        home: AddLinkScaffold(
          bottomAction: SizedBox(key: actionKey, height: 58),
          children: [SizedBox(height: 1400)],
        ),
      ),
    );

    final initialTop = tester.getTopLeft(find.byKey(actionKey)).dy;
    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    expect(
      tester.getTopLeft(find.byKey(actionKey)).dy,
      closeTo(initialTop, 0.1),
    );
  });
}
