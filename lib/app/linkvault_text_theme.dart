import 'package:flutter/material.dart';

TextTheme buildLinkVaultTextTheme({
  required Color ink,
  required Color secondary,
}) {
  const bodyFamily = 'Nunito';
  const displayFamily = 'Oswald';
  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: displayFamily,
      fontSize: 44,
      fontWeight: FontWeight.w500,
      height: 1,
      color: ink,
    ),
    displayMedium: TextStyle(
      fontFamily: displayFamily,
      fontSize: 40,
      fontWeight: FontWeight.w600,
      height: 1,
      color: ink,
    ),
    headlineLarge: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      height: 1,
      color: ink,
    ),
    headlineMedium: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.1,
      color: ink,
    ),
    titleLarge: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: ink,
    ),
    titleMedium: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: ink,
    ),
    bodyLarge: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: ink,
    ),
    bodyMedium: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: ink,
    ),
    bodySmall: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: secondary,
    ),
    labelLarge: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: ink,
    ),
    labelMedium: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: ink,
    ),
    labelSmall: TextStyle(
      fontFamily: bodyFamily,
      fontSize: 9,
      fontWeight: FontWeight.w600,
      height: 1.1,
      color: ink,
    ),
  );
}
