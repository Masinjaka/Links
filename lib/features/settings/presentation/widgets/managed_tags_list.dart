import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/settings/presentation/widgets/managed_tag_tile.dart';
import 'package:linkvault/features/settings/repository/managed_tag.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class ManagedTagsList extends StatelessWidget {
  const ManagedTagsList({
    super.key,
    required this.tags,
    required this.assetLabel,
    required this.selectionMode,
    required this.selectedNames,
    required this.onToggle,
  });

  final AsyncValue<List<ManagedTag>> tags;
  final String assetLabel;
  final bool selectionMode;
  final Set<String> selectedNames;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return tags.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Text(
          linkVaultLocalizationsOf(context).unableToLoadTags(error.toString()),
        ),
      ),
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Text(
              linkVaultLocalizationsOf(context).noAssetTags(assetLabel),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(32, 22, 32, 104),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final tag = items[index];
            return ManagedTagTile(
                  key: ValueKey('managed-tag-${tag.name}'),
                  tag: tag,
                  assetLabel: assetLabel,
                  selectionMode: selectionMode,
                  selected: selectedNames.contains(tag.name),
                  onTap: () => onToggle(tag.name),
                )
                .animate(key: ValueKey('${tag.name}-$index'))
                .fadeIn(duration: 180.ms, delay: (index * 28).ms)
                .slideY(begin: .06, end: 0);
          },
        );
      },
    );
  }
}
