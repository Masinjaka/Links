import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:linkvault/app/navigation_scroll_overlap.dart';
import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/app/widgets/primary_add_button.dart';
import 'package:linkvault/app/widgets/primary_navigation_bar.dart';

void main() {
  testWidgets('navigation uses a compact pill and detached add action', (
    tester,
  ) async {
    int? selectedIndex;

    await tester.pumpWidget(
      MaterialApp(
        theme: LinkVaultTheme.light(const Color(0xFFFF6262)),
        home: Scaffold(
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 400,
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryNavigationBar(
                      currentIndex: 0,
                      onDestinationSelected: (index) {
                        selectedIndex = index;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  PrimaryAddButton(onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Links'), findsOneWidget);
    expect(find.byType(GNav), findsOneWidget);
    expect(
      tester.widget<GNav>(find.byType(GNav)).duration,
      const Duration(milliseconds: 250),
    );
    expect(tester.getSize(find.byType(PrimaryNavigationBar)).height, 56);
    expect(
      tester.getSize(find.byKey(const Key('primary-navigation-item-0'))).height,
      50,
    );
    expect(
      tester.getSize(find.byKey(const Key('primary-navigation-item-0'))).width,
      closeTo(130, 4),
    );
    expect(
      tester.widget<Text>(find.text('Links')).style?.fontWeight,
      FontWeight.w900,
    );
    final selected = tester.getRect(
      find.byKey(const Key('primary-navigation-item-0')),
    );
    final selectedIcon = tester.getRect(
      find
          .descendant(
            of: find.byKey(const Key('primary-navigation-item-0')),
            matching: find.byIcon(Icons.link_rounded),
          )
          .first,
    );
    final selectedLabel = tester.getRect(find.text('Links'));
    final contentCenter = (selectedIcon.left + selectedLabel.right) / 2;
    expect(contentCenter, closeTo(selected.center.dx, 1));
    expect(tester.getSize(find.byType(PrimaryAddButton)), const Size(56, 56));
    expect(find.byIcon(Icons.add_rounded), findsOneWidget);

    await tester.tap(find.byKey(const Key('primary-navigation-item-1')));
    await tester.pumpAndSettle();

    expect(selectedIndex, 1);
  });

  testWidgets('unselected edge items have balanced outer spacing', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LinkVaultTheme.light(const Color(0xFFFF6262)),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 320,
              child: PrimaryNavigationBar(
                currentIndex: 1,
                onDestinationSelected: (_) {},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final bar = tester.getRect(find.byType(PrimaryNavigationBar));
    final firstCenter = tester.getCenter(
      find
          .descendant(
            of: find.byKey(const Key('primary-navigation-item-0')),
            matching: find.byIcon(Icons.link_rounded),
          )
          .first,
    );
    final lastCenter = tester.getCenter(
      find
          .descendant(
            of: find.byKey(const Key('primary-navigation-item-2')),
            matching: find.byIcon(Icons.settings_outlined),
          )
          .first,
    );
    final leadingSpace = firstCenter.dx - bar.left;
    final trailingSpace = bar.right - lastCenter.dx;

    expect(
      tester.getSize(find.byKey(const Key('primary-navigation-item-1'))).width,
      closeTo(130, 4),
    );
    expect(leadingSpace, closeTo(47, 4));
    expect(trailingSpace, closeTo(47, 4));
    expect((leadingSpace - trailingSpace).abs(), lessThanOrEqualTo(2));
  });

  testWidgets('uses glass only while content is behind the bar', (
    tester,
  ) async {
    Future<void> pumpBar(bool glass) {
      return tester.pumpWidget(
        MaterialApp(
          theme: LinkVaultTheme.light(const Color(0xFFFF6262)),
          home: PrimaryNavigationBar(
            currentIndex: 0,
            glass: glass,
            onDestinationSelected: (_) {},
          ),
        ),
      );
    }

    await pumpBar(false);
    expect(
      tester
          .widget<BackdropFilter>(
            find.byKey(const Key('primary-navigation-backdrop')),
          )
          .enabled,
      isFalse,
    );

    await pumpBar(true);
    final backdrop = tester.widget<BackdropFilter>(
      find.byKey(const Key('primary-navigation-backdrop')),
    );
    final surface = tester.widget<AnimatedContainer>(
      find.byKey(const Key('primary-navigation-surface')),
    );
    final decoration = surface.decoration! as BoxDecoration;
    expect(backdrop.enabled, isTrue);
    expect(decoration.color!.a, lessThan(1));
    expect(decoration.border, isNotNull);
  });

  test('detects content within the navigation overlap zone', () {
    FixedScrollMetrics metrics(double pixels) {
      return FixedScrollMetrics(
        minScrollExtent: 0,
        maxScrollExtent: 500,
        pixels: pixels,
        viewportDimension: 600,
        axisDirection: AxisDirection.down,
        devicePixelRatio: 1,
      );
    }

    expect(hasContentBehindNavigation(metrics(300), clearExtent: 72), isTrue);
    expect(hasContentBehindNavigation(metrics(450), clearExtent: 72), isFalse);
  });
}
