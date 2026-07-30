import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class LinkCardActionButton extends StatelessWidget {
  const LinkCardActionButton({
    super.key,
    required this.icon,
    required this.tooltip,
    this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        key: Key('link-card-action-$tooltip'),
        color: LinkVaultThemeTokens.background(context).withValues(alpha: .48),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox.square(
            dimension: 34,
            child: Icon(
              icon,
              size: 19,
              color: LinkVaultThemeTokens.ink(context),
            ),
          ),
        ),
      ),
    );
  }
}
