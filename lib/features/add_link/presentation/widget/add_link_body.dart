import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/add_link/presentation/widget/add_link_scaffold.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_tag_section.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_details_fields.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_save_button.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_url_field.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_widgets.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class AddLinkBody extends StatelessWidget {
  const AddLinkBody({
    super.key,
    required this.isEditing,
    required this.isSaving,
    required this.urlController,
    required this.tagController,
    required this.noteController,
    required this.urlDraft,
    required this.preview,
    required this.availableTags,
    required this.selectedTags,
    required this.collections,
    required this.selectedCollectionId,
    this.sheetMode = false,
    required this.onBack,
    required this.onUrlChanged,
    required this.onAddTag,
    required this.onToggleTag,
    required this.onCollectionSelected,
    required this.onSave,
  });

  final bool isEditing;
  final bool isSaving;
  final TextEditingController urlController;
  final TextEditingController tagController;
  final TextEditingController noteController;
  final String urlDraft;
  final AsyncValue<AddLinkMetadata?> preview;
  final List<String> availableTags;
  final Set<String> selectedTags;
  final List<CollectionWithCount> collections;
  final int? selectedCollectionId;
  final bool sheetMode;
  final VoidCallback onBack;
  final ValueChanged<String> onUrlChanged;
  final ValueChanged<String> onAddTag;
  final ValueChanged<String> onToggleTag;
  final ValueChanged<int?> onCollectionSelected;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    final hasUrl = urlDraft.trim().isNotEmpty;
    final strings = linkVaultLocalizationsOf(context);

    return AddLinkScaffold(
      sheetMode: sheetMode,
      bottomAction: AddLinkSaveButton(
        label: isSaving
            ? (isEditing ? strings.updating : strings.saving)
            : (isEditing ? strings.updateLink : strings.addLink),
        onPressed: onSave,
      ),
      children: [
        AddLinkPageHeader(
          onBack: onBack,
          title: isEditing ? strings.editLink : strings.newLink,
        ),
        const SizedBox(height: 24),
        AddLinkUrlField(controller: urlController, onChanged: onUrlChanged),
        if (hasUrl) ...[
          const SizedBox(height: 18),
          AddLinkMetadataPreview(preview: preview, rawUrl: urlDraft),
          const SizedBox(height: 28),
        ] else
          const SizedBox(height: 28),
        AddLinkDetailsFields(
          noteController: noteController,
          collections: collections,
          selectedCollectionId: selectedCollectionId,
          onCollectionSelected: onCollectionSelected,
        ),
        const SizedBox(height: 18),
        AddLinkTagSection(
          availableTags: availableTags,
          selectedTags: selectedTags,
          controller: tagController,
          onAdd: onAddTag,
          onToggle: onToggleTag,
        ),
      ],
    );
  }
}
