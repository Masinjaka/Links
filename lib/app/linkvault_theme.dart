import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkVaultColors {
  static const Color _defaultPrimary = Color(0xFFD90429);
  static const Color _lightOnPrimary = Color(0xFFEDF2F4);
  static const Color _darkOnPrimary = Color(0xFF000000);

  static Color _primary = _defaultPrimary;
  static Color _onPrimary = _lightOnPrimary;

  static Color get primary => _primary;
  static Color get onPrimary => _onPrimary;
  static const secondary = Color(0xFF8D99AE);
  static const background = Color(0xFFFFFFFF);
  static const surface = Color(0xFFE5E5E5);
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
    // final fontFamily = GoogleFonts.jersey25().fontFamily;
    final fontFamily = GoogleFonts.nunito().fontFamily;

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
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          height: 1,
          letterSpacing: 0,
          color: ink,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.1,
          letterSpacing: 0,
          color: ink,
        ),
        titleLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0,
          color: ink,
        ),
        titleMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: 0,
          color: ink,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.4,
          letterSpacing: 0,
          color: ink,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.4,
          letterSpacing: 0,
          color: ink,
        ),
        bodySmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.4,
          letterSpacing: 0,
          color: secondary,
        ),
        labelLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0,
          color: ink,
        ),
        labelMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0,
          color: ink,
        ),
        labelSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0,
          color: ink,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        isCollapsed: true,
        hintStyle: TextStyle(
          color: secondary,
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),
      ),
    );
  }
}

class LinkVaultThemeTokens {
  static const double componentRadiusValue = 20;

  static Color primary(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  static Color onPrimary(BuildContext context) {
    return Theme.of(context).colorScheme.onPrimary;
  }

  static Color onInk(BuildContext context) {
    return ThemeData.estimateBrightnessForColor(ink(context)) == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  static Color background(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  static Color surface(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  static Color ink(BuildContext context) {
    return Theme.of(context).colorScheme.onSurface;
  }

  static Color secondaryInk(BuildContext context, {double alpha = .72}) {
    return ink(context).withValues(alpha: alpha);
  }

  static BorderRadius get componentRadius =>
      BorderRadius.circular(componentRadiusValue);
}
