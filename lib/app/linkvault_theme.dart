import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_text_theme.dart';

export 'package:linkvault/app/linkvault_theme_tokens.dart';

class LinkVaultColors {
  static const Color _defaultPrimary = Color(0xFFFF6262);
  static const Color _lightOnPrimary = Color(0xFFEDF2F4);
  static const Color _darkOnPrimary = Color(0xFF000000);

  static Color _primary = _defaultPrimary;
  static Color _onPrimary = _lightOnPrimary;

  static Color get primary => _primary;
  static Color get onPrimary => _onPrimary;
  static const secondary = Color(0xFF8D99AE);
  static const background = Color(0xFFFFFFFF);
  static const surface = Color(0xFFEDEDED);
  static const ink = Color(0xFF000000);
  static const success = Color(0xFF30D158);

  static void applyAccent(Color accent) {
    _primary = accent;
    _onPrimary = ThemeData.estimateBrightnessForColor(accent) == Brightness.dark
        ? _lightOnPrimary
        : _darkOnPrimary;
  }
}

class LinkVaultTheme {
  static ThemeData light(Color accentColor) {
    return _build(
      brightness: Brightness.light,
      accentColor: accentColor,
      background: LinkVaultColors.background,
      surface: LinkVaultColors.surface,
      ink: LinkVaultColors.ink,
      secondary: LinkVaultColors.secondary,
      onPrimary: LinkVaultColors.onPrimary,
    );
  }

  static ThemeData dark(Color accentColor) {
    return _build(
      brightness: Brightness.dark,
      accentColor: accentColor,
      background: const Color(0xFF121212),
      surface: const Color(0xFF1E1E1E),
      ink: const Color(0xFFF5F5F5),
      secondary: const Color(0xFF9A9A9A),
      onPrimary: LinkVaultColors.onPrimary,
    );
  }

  static ThemeData _build({
    required Brightness brightness,
    required Color accentColor,
    required Color background,
    required Color surface,
    required Color ink,
    required Color secondary,
    required Color onPrimary,
  }) {
    final base = ThemeData(useMaterial3: true, brightness: brightness);
    final textTheme = buildLinkVaultTextTheme(ink: ink, secondary: secondary);

    return base.copyWith(
      scaffoldBackgroundColor: background,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: accentColor,
            brightness: brightness,
          ).copyWith(
            primary: accentColor,
            onPrimary: onPrimary,
            secondary: secondary,
            surface: surface,
            onSurface: ink,
            error: accentColor,
          ),
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        isCollapsed: true,
        hintStyle: textTheme.bodyLarge?.copyWith(color: secondary),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ink,
        selectionColor: ink.withValues(alpha: .20),
        selectionHandleColor: ink,
      ),
    );
  }
}
