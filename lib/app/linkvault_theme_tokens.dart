import 'package:flutter/material.dart';

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
