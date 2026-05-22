import 'package:flutter/material.dart';
import 'package:linkvault/app/linkvault_theme.dart';

class FeedEmptyState extends StatelessWidget {
  const FeedEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ink = LinkVaultThemeTokens.ink(context);
    final surface = LinkVaultThemeTokens.surface(context);

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        // border: Border.all(color: ink),
        color: surface,
        borderRadius: LinkVaultThemeTokens.componentRadius,
        // boxShadow: [
        //   BoxShadow(color: ink, offset: const Offset(3, 3), blurRadius: 0),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NO_LINKS',
            style: textTheme.headlineMedium?.copyWith(color: ink),
          ),
          const SizedBox(height: 12),
          Text(
            'Add your first link to start building the feed.',
            style: textTheme.bodyLarge?.copyWith(color: ink, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
