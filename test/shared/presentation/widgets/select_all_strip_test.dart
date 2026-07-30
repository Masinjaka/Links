import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/shared/presentation/widgets/select_all_strip.dart';

void main() {
  testWidgets('selection strip matches the compact reference behavior', (
    tester,
  ) async {
    var selectAllTapped = false;
    var cancelTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 360,
            child: SelectAllStrip(
              selected: false,
              onTap: () => selectAllTapped = true,
              onCancel: () => cancelTapped = true,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Select all'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(tester.getSize(find.byType(SelectAllStrip)).height, 44);

    await tester.tap(find.text('Select all'));
    await tester.tap(find.text('Cancel'));

    expect(selectAllTapped, isTrue);
    expect(cancelTapped, isTrue);
  });
}
