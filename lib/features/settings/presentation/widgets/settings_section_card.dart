import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class SettingsSectionCard extends StatelessWidget {
  const SettingsSectionCard({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: LinkVaultThemeTokens.componentRadius,
          child: ColoredBox(
            color: LinkVaultThemeTokens.surface(context),
            child: Column(
              children: [
                for (final (index, child) in children.indexed) ...[
                  child,
                  if (index != children.length - 1)
                    Divider(
                      height: 1,
                      thickness: .6,
                      indent: 22,
                      endIndent: 22,
                      color: LinkVaultThemeTokens.secondaryInk(
                        context,
                        alpha: .20,
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
