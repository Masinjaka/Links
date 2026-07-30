import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class LinkDetailsUrlPill extends StatelessWidget {
  const LinkDetailsUrlPill({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.surface(context),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Text(
        url,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: LinkVaultThemeTokens.ink(context),
          fontSize: 13,
        ),
      ),
    );
  }
}
