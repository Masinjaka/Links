import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:linkvault/app/linkvault_theme.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, this.title, this.subtitle});
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? 'SAVEYO',
          style: textTheme.headlineLarge?.copyWith(
            color: LinkVaultThemeTokens.ink(context),
          ),
        ),
        Transform.rotate(
          angle: 2 * math.pi / 180,
          alignment: Alignment.centerLeft,
          child: Container(
            color: LinkVaultColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(
              subtitle ?? 'LINKS',
              style: textTheme.headlineMedium?.copyWith(
                color: LinkVaultColors.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
