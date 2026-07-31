import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class SettingsListRow extends StatelessWidget {
  const SettingsListRow({
    super.key,
    required this.icon,
    required this.label,
    this.value,
    this.onTap,
    this.destructive = false,
  });

  final IconData icon;
  final String label;
  final String? value;
  final VoidCallback? onTap;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final color = destructive
        ? LinkVaultColors.destructive
        : LinkVaultThemeTokens.ink(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 49,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              children: [
                Icon(icon, size: 21, color: color),
                const SizedBox(width: 23),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: color,
                      fontWeight: destructive ? FontWeight.w900 : null,
                    ),
                  ),
                ),
                if (value != null)
                  Text(
                    value!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: LinkVaultThemeTokens.secondaryInk(context),
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
