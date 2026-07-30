import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('all text fields use neutral theme ink for selection controls', () {
    final themes = [
      LinkVaultTheme.light(LinkVaultColors.primary),
      LinkVaultTheme.dark(LinkVaultColors.primary),
    ];

    for (final theme in themes) {
      final selectionTheme = theme.textSelectionTheme;
      final ink = theme.colorScheme.onSurface;

      expect(selectionTheme.cursorColor, ink);
      expect(selectionTheme.selectionHandleColor, ink);
      expect(selectionTheme.cursorColor, isNot(theme.colorScheme.primary));
    }
  });

  test('the redesigned default accent is coral red', () {
    expect(AppAccentTone.red.colorValue, 0xFFFF6262);
    expect(LinkVaultColors.primary, const Color(0xFFFF6262));
  });
}
