import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/app/widgets/primary_navigation_tab_content.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class PrimaryNavigationBar extends StatelessWidget {
  const PrimaryNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final accent = LinkVaultThemeTokens.primary(context);
    final localizations = linkVaultLocalizationsOf(context);
    final destinations = [
      (localizations.links, Icons.link_rounded),
      (localizations.collections, Icons.folder_copy_outlined),
      (localizations.settings, Icons.settings_outlined),
    ];
    return Container(
      height: 56,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.surface(context),
        borderRadius: BorderRadius.circular(30),
      ),
      child: GNav(
        selectedIndex: currentIndex,
        onTabChange: onDestinationSelected,
        duration: const Duration(milliseconds: 250),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        haptic: true,
        color: LinkVaultThemeTokens.ink(context),
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
                color: index == currentIndex
                    ? accent
                    : LinkVaultThemeTokens.ink(context),
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
