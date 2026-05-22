import 'package:flutter/material.dart';

class OnboardingStep {
  const OnboardingStep({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    this.showPlatforms = false,
  });

  final String number;
  final String title;
  final String description;
  final IconData icon;
  final bool showPlatforms;
}
