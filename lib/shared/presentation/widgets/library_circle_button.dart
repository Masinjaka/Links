import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class LibraryCircleButton extends StatelessWidget {
  const LibraryCircleButton({
    super.key,
    required this.icon,
    required this.tooltip,
    this.onPressed,
    this.badgeCount = 0,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String tooltip;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: LinkVaultThemeTokens.surface(context),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox.square(
            dimension: 44,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(icon, size: 21, color: LinkVaultThemeTokens.ink(context)),
                if (badgeCount > 0)
                  Positioned(
                    top: 6,
                    right: 5,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: LinkVaultColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
