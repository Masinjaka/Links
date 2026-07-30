import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_tag_choice_chip.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_tags_sheet.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class AddLinkTagSection extends StatelessWidget {
  const AddLinkTagSection({
    super.key,
    required this.availableTags,
    required this.selectedTags,
    required this.controller,
    required this.onAdd,
    required this.onToggle,
  });

  final List<String> availableTags;
  final Set<String> selectedTags;
  final TextEditingController controller;
  final ValueChanged<String> onAdd;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              linkVaultLocalizationsOf(context).tags,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 10),
            Material(
              color: LinkVaultColors.primary,
              shape: const CircleBorder(),
              child: InkWell(
                key: const Key('add-link-new-tag-button'),
                onTap: () => showAddLinkTagsSheet(
                  context: context,
                  availableTags: availableTags,
                  selectedTags: selectedTags,
                  controller: controller,
                  onAdd: onAdd,
                  onToggle: onToggle,
                ),
                customBorder: const CircleBorder(),
                child: const SizedBox.square(
                  dimension: 20,
                  child: Icon(Icons.add_rounded, size: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        if (selectedTags.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tag in selectedTags)
                AddLinkTagChoiceChip(
                  tag: tag,
                  selected: true,
                  onTap: () => onToggle(tag),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
