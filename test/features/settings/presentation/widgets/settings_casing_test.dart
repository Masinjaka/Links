import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/settings/presentation/widget/settings_widgets.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';

void main() {
  testWidgets('settings labels and controls render lowercase text', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 390,
            child: Column(
              children: [
                const SettingsHeader(),
                SettingsSection(
                  title: 'APPEARANCE',
                  children: [
                    SettingsOptionRow(
                      title: 'THEME',
                      control: ThemeModeSelector(
                        selected: AppThemePreference.light,
                        onSelected: (_) {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('settings'), findsOneWidget);
    expect(find.text('appearance'), findsOneWidget);
    expect(find.text('theme'), findsOneWidget);
    expect(find.text('light'), findsOneWidget);
    expect(find.text('dark'), findsOneWidget);
    expect(find.text('system'), findsOneWidget);
    expect(find.text('APPEARANCE'), findsNothing);
  });
}
