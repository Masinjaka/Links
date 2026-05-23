import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class PrimaryNavigationShell extends StatelessWidget {
  const PrimaryNavigationShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _destinations = <_ShellDestination>[
    _ShellDestination(
      label: 'Links',
      icon: Icons.link_outlined,
      selectedIcon: Icons.link_rounded,
    ),
    _ShellDestination(
      label: 'Collections',
      icon: Icons.folder_copy_outlined,
      selectedIcon: Icons.folder_copy_rounded,
    ),
    _ShellDestination(
      label: 'Settings',
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = LinkVaultThemeTokens.background(context);
    final selectedColor = isDark ? Colors.white : Colors.black;
    final unselectedColor = selectedColor.withValues(alpha: .42);
    final borderColor = LinkVaultThemeTokens.ink(
      context,
    ).withValues(alpha: .18);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            color: background,
            border: Border(top: BorderSide(color: borderColor, width: 1)),
          ),
          child: SizedBox(
            height: 72,
            child: Row(
              children: [
                for (final (index, destination) in _destinations.indexed)
                  Expanded(
                    child: _ShellNavItem(
                      destination: destination,
                      selected: navigationShell.currentIndex == index,
                      selectedColor: selectedColor,
                      unselectedColor: unselectedColor,
                      onTap: () {
                        navigationShell.goBranch(
                          index,
                          initialLocation:
                              index == navigationShell.currentIndex,
                        );
                      },
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

class _ShellDestination {
  const _ShellDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

class _ShellNavItem extends StatelessWidget {
  const _ShellNavItem({
    required this.destination,
    required this.selected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTap,
  });

  final _ShellDestination destination;
  final bool selected;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? selectedColor : unselectedColor;

    return Semantics(
      button: true,
      selected: selected,
      label: destination.label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                  selected ? destination.selectedIcon : destination.icon,
                  color: color,
                  size: 24,
                )
                .animate(target: selected ? 1 : 0)
                .scaleXY(
                  end: 1.12,
                  duration: 180.ms,
                  curve: Curves.easeOutCubic,
                ),
            const SizedBox(height: 6),
            Text(
              destination.label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: color,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
