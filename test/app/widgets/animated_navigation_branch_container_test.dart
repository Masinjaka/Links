import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/widgets/animated_navigation_branch_container.dart';

void main() {
  testWidgets('animates toward the selected navigation branch', (tester) async {
    final children = [
      const ColoredBox(color: Colors.red),
      const ColoredBox(color: Colors.blue),
      const ColoredBox(color: Colors.green),
    ];

    await tester.pumpWidget(_app(currentIndex: 0, children: children));

    expect(_slide(tester, 0).offset, Offset.zero);
    expect(_slide(tester, 1).offset.dx, greaterThan(0));

    await tester.pumpWidget(_app(currentIndex: 2, children: children));

    expect(_slide(tester, 0).offset.dx, lessThan(0));
    expect(_slide(tester, 2).offset, Offset.zero);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('preserves inactive branch state', (tester) async {
    final children = [
      const Material(child: TextField(key: Key('stateful-field'))),
      const ColoredBox(color: Colors.blue),
    ];

    await tester.pumpWidget(_app(currentIndex: 0, children: children));
    await tester.enterText(find.byKey(const Key('stateful-field')), 'retained');

    await tester.pumpWidget(_app(currentIndex: 1, children: children));
    await tester.pumpAndSettle();
    await tester.pumpWidget(_app(currentIndex: 0, children: children));
    await tester.pumpAndSettle();

    expect(find.text('retained'), findsOneWidget);
  });
}

Widget _app({required int currentIndex, required List<Widget> children}) {
  return MaterialApp(
    home: AnimatedNavigationBranchContainer(
      currentIndex: currentIndex,
      children: children,
    ),
  );
}

AnimatedSlide _slide(WidgetTester tester, int index) {
  return tester.widget<AnimatedSlide>(
    find.byKey(Key('navigation-branch-$index')),
  );
}
