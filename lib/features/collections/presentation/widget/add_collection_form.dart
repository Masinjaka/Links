import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_tag_choice_chip.dart';
import 'package:linkvault/features/collections/presentation/widget/add_collection_save_button.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_icon_catalog.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_pill_text_field.dart';

class AddCollectionForm extends StatelessWidget {
  const AddCollectionForm({
    super.key,
    required this.sheetMode,
    required this.isEditing,
    required this.saving,
    required this.titleController,
    required this.selectedIconKey,
    required this.selectedTag,
    required this.onClose,
    required this.onChooseIcon,
    required this.onChooseTags,
    required this.onSave,
  });

  final bool sheetMode;
  final bool isEditing;
  final bool saving;
  final TextEditingController titleController;
  final String selectedIconKey;
  final String? selectedTag;
  final VoidCallback onClose;
  final VoidCallback onChooseIcon;
  final VoidCallback onChooseTags;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    final content = Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
            children: [
              _header(context),
              const SizedBox(height: 24),
              LibraryPillTextField(
                controller: titleController,
                fieldKey: const Key('collection-name-field'),
                hintText: localizations.collectionName,
                height: 52,
              ),
              const SizedBox(height: 28),
              _iconField(context),
              const SizedBox(height: 22),
              _tags(context),
            ],
          ),
        ),
        SafeArea(
          top: false,
          minimum: const EdgeInsets.fromLTRB(32, 12, 32, 18),
          child: AddCollectionSaveButton(
            label: saving
                ? (isEditing ? localizations.updating : localizations.saving)
                : (isEditing
                      ? localizations.updateCollection
                      : localizations.addCollection),
            onPressed: onSave,
          ),
        ),
      ],
    );
    if (!sheetMode) {
      return Scaffold(
        backgroundColor: LinkVaultThemeTokens.background(context),
        body: SafeArea(bottom: false, child: content),
      );
    }
    return Material(
      key: const Key('add-collection-sheet-surface'),
      color: LinkVaultThemeTokens.background(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      clipBehavior: Clip.antiAlias,
      child: content,
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            isEditing
                ? linkVaultLocalizationsOf(context).editCollection
                : linkVaultLocalizationsOf(context).newCollection,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: LinkVaultThemeTokens.ink(context),
              fontFamily: 'Oswald',
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        IconButton(
          key: const Key('add-collection-close'),
          onPressed: onClose,
          tooltip: linkVaultLocalizationsOf(context).close,
          icon: const Icon(Icons.close_rounded, size: 24),
        ),
      ],
    );
  }

  Widget _iconField(BuildContext context) {
    return Material(
      color: LinkVaultThemeTokens.surface(context),
      borderRadius: BorderRadius.circular(25),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: const Key('collection-icon-selector'),
        onTap: onChooseIcon,
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  linkVaultLocalizationsOf(context).icon,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                Icon(
                  key: ValueKey('selected-collection-icon-$selectedIconKey'),
                  collectionIconForKey(selectedIconKey),
                  size: 16,
                  color: LinkVaultThemeTokens.secondaryInk(context),
                ),
                const SizedBox(width: 6),
                Text(
                  linkVaultLocalizationsOf(context).choose,
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

  Widget _tags(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              linkVaultLocalizationsOf(context).tags,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(width: 10),
            Material(
              color: LinkVaultColors.primary,
              shape: const CircleBorder(),
              child: InkWell(
                key: const Key('collection-tag-picker-button'),
                onTap: onChooseTags,
                customBorder: const CircleBorder(),
                child: const SizedBox.square(
                  dimension: 20,
                  child: Icon(Icons.add_rounded, color: Colors.white, size: 14),
                ),
              ),
            ),
          ],
        ),
        if (selectedTag != null) ...[
          const SizedBox(height: 16),
          AddLinkTagChoiceChip(
            tag: selectedTag!,
            selected: true,
            onTap: onChooseTags,
          ),
        ],
      ],
    );
  }
}
