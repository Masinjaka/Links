import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

enum TagsLibraryTab { links, collections }

class TagsLibraryTabs extends StatelessWidget {
  const TagsLibraryTabs({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final TagsLibraryTab selected;
  final ValueChanged<TagsLibraryTab> onSelected;

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
                TagsLibraryTab.links,
                linkVaultLocalizationsOf(context).links,
              ),
              _tab(
                context,
                TagsLibraryTab.collections,
                linkVaultLocalizationsOf(context).collections,
              ),
            ],
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            alignment: selected == TagsLibraryTab.links
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

  Widget _tab(BuildContext context, TagsLibraryTab value, String label) {
    final active = selected == value;
    return Expanded(
      child: InkWell(
        key: ValueKey('tags-tab-${value.name}'),
        onTap: () => onSelected(value),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: active ? FontWeight.w800 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
