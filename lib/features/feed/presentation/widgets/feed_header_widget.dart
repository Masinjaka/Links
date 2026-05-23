import 'package:flutter/material.dart';
import 'package:linkvault/app/linkvault_theme.dart';

class FeedHeader extends StatelessWidget {
  const FeedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Rohy',
            style: textTheme.titleLarge?.copyWith(
              color: LinkVaultThemeTokens.ink(context),
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
