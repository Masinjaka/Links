import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_collection_sheet.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

class AddLinkDetailsFields extends StatelessWidget {
  const AddLinkDetailsFields({
    super.key,
    required this.noteController,
    required this.collections,
    required this.selectedCollectionId,
    required this.onCollectionSelected,
  });

  final TextEditingController noteController;
  final List<CollectionWithCount> collections;
  final int? selectedCollectionId;
  final ValueChanged<int?> onCollectionSelected;

  @override
  Widget build(BuildContext context) {
    final surface = LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);
    final collectionName = _selectedCollectionName();
    return Column(
      children: [
        Material(
          color: surface,
          borderRadius: BorderRadius.circular(23),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            key: const Key('add-link-collection-selector'),
            onTap: () => showAddLinkCollectionSheet(
              context: context,
              collections: collections,
              selectedCollectionId: selectedCollectionId,
              onDone: onCollectionSelected,
            ),
            child: Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    linkVaultLocalizationsOf(context).collection,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    collectionName?.sentenceDisplayText ??
                        linkVaultLocalizationsOf(context).noCollection,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: LinkVaultThemeTokens.secondaryInk(context),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Container(
          key: const Key('add-link-note-container'),
          height: 94,
          padding: const EdgeInsets.fromLTRB(16, 13, 12, 8),
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                linkVaultLocalizationsOf(context).note,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              Expanded(
                child: TextField(
                  key: const Key('add-link-note-field'),
                  controller: noteController,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  cursorColor: ink,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: ink),
                  decoration: InputDecoration(
                    hintText: linkVaultLocalizationsOf(context).addNote,
                    hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: LinkVaultThemeTokens.secondaryInk(context),
                    ),
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.only(top: 8),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String? _selectedCollectionName() {
    for (final group in collections) {
      if (group.collection.id == selectedCollectionId) {
        return group.collection.title;
      }
    }
    return null;
  }
}
