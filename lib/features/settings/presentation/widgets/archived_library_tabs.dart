import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

enum ArchivedLibraryTab { links, collections }

class ArchivedLibraryTabs extends StatelessWidget {
  const ArchivedLibraryTabs({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final ArchivedLibraryTab selected;
  final ValueChanged<ArchivedLibraryTab> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Row(
            children: [
              _tab(
                context,
                ArchivedLibraryTab.links,
                linkVaultLocalizationsOf(context).links,
              ),
              _tab(
                context,
                ArchivedLibraryTab.collections,
                linkVaultLocalizationsOf(context).collections,
              ),
            ],
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            alignment: selected == ArchivedLibraryTab.links
                ? Alignment.bottomLeft
                : Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: .5,
              child: Container(
                height: 3,
                color: LinkVaultThemeTokens.primary(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(BuildContext context, ArchivedLibraryTab value, String label) {
    final isSelected = selected == value;
    return Expanded(
      child: InkWell(
        key: ValueKey('archived-tab-${value.name}'),
        onTap: () => onSelected(value),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
