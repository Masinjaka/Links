import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/widgets/library_bottom_sheet.dart';

import '../../../support/linkvault_test_harness.dart';

void main() {
  testWidgets('renders the redesigned grouped settings screen', (tester) async {
    await tester.pumpLinkVault('/settings');

    expect(find.text('SETTING'), findsOneWidget);
    expect(find.text('Preferences'), findsOneWidget);
    expect(find.text('Theme'), findsOneWidget);
    expect(find.text('Light'), findsOneWidget);
    expect(find.text('Accent color'), findsOneWidget);
    expect(find.text('Red'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Links'), findsNWidgets(2));
    expect(find.text('Export links to CSV'), findsOneWidget);
    expect(find.text('Import from CSV'), findsNothing);
    expect(find.text('Archived'), findsOneWidget);
    expect(find.text('Tags'), findsOneWidget);
    expect(find.text('Erase data'), findsOneWidget);
    expect(tester.widget<Text>(find.text('Preferences')).style?.fontSize, 15);
    expect(tester.widget<Text>(find.text('Theme')).style?.fontSize, 16);
    expect(tester.widget<Text>(find.text('Accent color')).style?.fontSize, 16);
    expect(
      tester.widget<Text>(find.text('Export links to CSV')).style?.fontSize,
      16,
    );
  });

  testWidgets('reuses the choice sheet for every preference', (tester) async {
    await tester.pumpLinkVault('/settings');

    await tester.tap(find.byKey(const Key('settings-theme-row')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('settings-choice-sheet')), findsOneWidget);
    expect(find.byType(LibraryBottomSheetSurface), findsOneWidget);
    expect(find.text('Dark'), findsOneWidget);
    expect(find.text('System'), findsOneWidget);
    await tester.tap(find.byKey(const Key('settings-choice-option-1')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('settings-choice-done')));
    await tester.pumpAndSettle();
    expect(find.text('Dark'), findsOneWidget);

    await tester.tap(find.byKey(const Key('settings-accent-row')));
    await tester.pumpAndSettle();
    expect(find.text('Purple'), findsOneWidget);
    await tester.tap(find.byKey(const Key('settings-choice-option-3')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('settings-choice-done')));
    await tester.pumpAndSettle();
    expect(find.text('Purple'), findsOneWidget);

    await tester.tap(find.byKey(const Key('settings-language-row')));
    await tester.pumpAndSettle();
    expect(find.text('Malagasy'), findsOneWidget);
    expect(find.text('French'), findsOneWidget);
    await tester.tap(find.byKey(const Key('settings-choice-option-0')));
    await tester.pumpAndSettle();
    expect(find.text('Fiteny'), findsOneWidget);
    expect(find.text('Vita'), findsOneWidget);
    await tester.tap(find.byKey(const Key('settings-choice-done')));
    await tester.pumpAndSettle();
    expect(find.text('Malagasy'), findsOneWidget);
  });

  testWidgets('theme and language sheets fit an iPhone safe area', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(393, 852);
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(bottom: 34);
    tester.view.viewPadding = const FakeViewPadding(bottom: 34);
    addTearDown(tester.view.reset);
    await tester.pumpLinkVault('/settings');

    await tester.tap(find.byKey(const Key('settings-theme-row')));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    await tester.tap(find.byKey(const Key('settings-choice-done')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('settings-language-row')));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('accent updates the settings add action immediately', (
    tester,
  ) async {
    await tester.pumpLinkVault('/settings');
    const buttonKey = Key('primary-add-button-material');

    expect(
      tester.widget<Material>(find.byKey(buttonKey)).color,
      const Color(0xFFFF6262),
    );
    await tester.tap(find.byKey(const Key('settings-accent-row')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('settings-choice-option-1')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('settings-choice-sheet')), findsOneWidget);
    expect(
      tester.widget<Material>(find.byKey(buttonKey)).color,
      const Color(0xFF30D158),
    );
    final eraseText = tester.widget<Text>(find.text('Erase data'));
    final eraseIcon = tester.widget<Icon>(
      find.descendant(
        of: find.byKey(const Key('settings-erase-data-row')),
        matching: find.byType(Icon),
      ),
    );
    expect(eraseText.style?.color, LinkVaultColors.destructive);
    expect(eraseText.style?.fontWeight, FontWeight.w900);
    expect(eraseIcon.color, LinkVaultColors.destructive);
  });
}
