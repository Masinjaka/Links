import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/splash/presentation/splash_animation_timing.dart';
import 'package:linkvault/features/splash/presentation/splash_page.dart';

void main() {
  testWidgets('stages each letter before revealing the badge', (tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashPage(onComplete: () {})));

    await tester.pump(SplashAnimationTiming.initialDelay);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 70));

    expect(_opacityOf(tester, const Key('splash-letter-R')), greaterThan(0));
    expect(_opacityOf(tester, const Key('splash-letter-o')), 0);
    expect(_opacityOf(tester, const Key('splash-link-badge')), 0);

    await tester.pump(SplashAnimationTiming.letterStagger);
    await tester.pump(const Duration(milliseconds: 10));

    expect(_opacityOf(tester, const Key('splash-letter-o')), greaterThan(0));
    expect(_opacityOf(tester, const Key('splash-link-badge')), 0);

    for (var frame = 0; frame < 15; frame++) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(_opacityOf(tester, const Key('splash-link-badge')), 1);
    expect(_opacityOf(tester, const Key('splash-expanding-circle')), 0);

    await tester.pump(SplashAnimationTiming.totalDuration);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('reveals the full mark before completing', (tester) async {
    var completions = 0;

    await tester.pumpWidget(
      MaterialApp(home: SplashPage(onComplete: () => completions++)),
    );

    expect(find.byKey(const Key('splash-letter-R')), findsOneWidget);
    expect(find.byKey(const Key('splash-letter-o')), findsOneWidget);
    expect(find.byKey(const Key('splash-letter-h')), findsOneWidget);
    expect(find.byKey(const Key('splash-letter-y')), findsOneWidget);
    expect(find.byKey(const Key('splash-link-badge')), findsOneWidget);
    expect(find.byKey(const Key('splash-expanding-circle')), findsOneWidget);
    expect(completions, 0);

    await tester.pump(SplashAnimationTiming.totalDuration);

    expect(completions, 1);
  });

  testWidgets('adapts without overflow on a narrow viewport', (tester) async {
    tester.view.physicalSize = const Size(280, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(home: SplashPage(onComplete: () {})));
    await tester.pump(SplashAnimationTiming.iconDelay);

    expect(tester.takeException(), isNull);
    expect(find.bySemanticsLabel('Rohy'), findsOneWidget);
  });
}

double _opacityOf(WidgetTester tester, Key key) {
  final fade = find.ancestor(
    of: find.byKey(key),
    matching: find.byType(FadeTransition),
  );
  return tester.widget<FadeTransition>(fade.first).opacity.value;
}
