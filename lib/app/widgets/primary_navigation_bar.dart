import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/app/widgets/primary_navigation_tab_content.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/glass_surface.dart';

class PrimaryNavigationBar extends StatelessWidget {
  const PrimaryNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    this.glass = false,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool glass;

  @override
  Widget build(BuildContext context) {
    final accent = LinkVaultThemeTokens.primary(context);
    final localizations = linkVaultLocalizationsOf(context);
    final destinations = [
      (localizations.links, Icons.link_rounded),
      (localizations.collections, Icons.folder_copy_outlined),
      (localizations.settings, Icons.settings_outlined),
    ];
    final radius = BorderRadius.circular(30);
    final ink = LinkVaultThemeTokens.ink(context);
    final surface = LinkVaultThemeTokens.surface(context);
    return GlassSurface(
      enabled: glass,
      borderRadius: radius,
      color: surface,
      glassColor: surface.withValues(alpha: .58),
      border: Border.all(color: ink.withValues(alpha: .1)),
      height: 56,
      padding: const EdgeInsets.all(3),
      backdropKey: const Key('primary-navigation-backdrop'),
      surfaceKey: const Key('primary-navigation-surface'),
      child: GNav(
        selectedIndex: currentIndex,
        onTabChange: onDestinationSelected,
        duration: const Duration(milliseconds: 250),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        haptic: true,
        color: ink,
        activeColor: accent,
        tabBackgroundColor: LinkVaultThemeTokens.background(context),
        tabBorderRadius: 27,
        iconSize: 20,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        tabs: [
          for (final (index, destination) in destinations.indexed)
            GButton(
              key: Key('primary-navigation-item-$index'),
              icon: destination.$2,
              text: '',
              leading: PrimaryNavigationTabContent(
                icon: destination.$2,
                label: destination.$1,
                active: index == currentIndex,
                color: index == currentIndex ? accent : ink,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: index == currentIndex ? 11 : 8,
                vertical: 15,
              ),
              margin: EdgeInsets.only(
                left: index == 0 && currentIndex != 0 ? 26 : 0,
                right: index == 2 && currentIndex != 2 ? 26 : 0,
              ),
            ),
        ],
      ),
    );
  }
}
