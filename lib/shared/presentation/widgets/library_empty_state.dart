import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class LibraryEmptyState extends StatelessWidget {
  const LibraryEmptyState({super.key, required this.title, this.subtitle});

  static const lightIllustrationAsset = 'assets/svg/no-link-light.png';
  static const darkIllustrationAsset = 'assets/svg/no-link-dark.png';

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final illustrationAsset = Theme.of(context).brightness == Brightness.dark
        ? darkIllustrationAsset
        : lightIllustrationAsset;

    return Center(
      child: Transform.translate(
        key: const Key('library-empty-content'),
        offset: const Offset(0, -20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              illustrationAsset,
              key: const Key('library-empty-illustration'),
              width: 178,
              height: 110,
              fit: BoxFit.cover,
              alignment: const Alignment(0, -.2),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              key: const Key('library-empty-title'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: LinkVaultThemeTokens.secondaryInk(context, alpha: .78),
                fontWeight: FontWeight.w700,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(
                subtitle!,
                key: const Key('library-empty-subtitle'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: LinkVaultThemeTokens.secondaryInk(context, alpha: .78),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
