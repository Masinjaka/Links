import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/linkvault_theme.dart';

void main() {
  test('ThemeData exposes the shared semantic typography scale', () {
    final theme = LinkVaultTheme.light(const Color(0xFFFF6262));

    expect(theme.textTheme.bodyLarge?.fontSize, 16);
    expect(theme.textTheme.bodyMedium?.fontSize, 15);
    expect(theme.textTheme.bodySmall?.fontSize, 12);
    expect(
      theme.inputDecorationTheme.hintStyle?.fontSize,
      theme.textTheme.bodyLarge?.fontSize,
    );
  });
}
