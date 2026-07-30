import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class PrimaryAddMenu extends StatelessWidget {
  const PrimaryAddMenu({
    super.key,
    required this.onAddLink,
    required this.onAddCollection,
  });

  final VoidCallback onAddLink;
  final VoidCallback onAddCollection;

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    return Material(
      key: const Key('primary-add-menu'),
      color: LinkVaultThemeTokens.background(context),
      elevation: 6,
      shadowColor: Colors.black.withValues(alpha: .16),
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 152,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MenuAction(label: localizations.addLink, onTap: onAddLink),
              _MenuAction(
                label: localizations.addCollection,
                onTap: onAddCollection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuAction extends StatelessWidget {
  const _MenuAction({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 42,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: LinkVaultThemeTokens.primary(context),
                  shape: BoxShape.circle,
                ),
                child: const SizedBox.square(
                  dimension: 15,
                  child: Icon(Icons.add_rounded, size: 12, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
