import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/domain/tag_name_normalizer.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_tags_sheet.dart';
import 'package:linkvault/features/collections/presentation/widget/add_collection_form.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_icon_picker_sheet.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class AddCollectionPage extends ConsumerStatefulWidget {
  const AddCollectionPage({
    super.key,
    this.collectionId,
    this.sheetMode = false,
  });

  final int? collectionId;
  final bool sheetMode;

  @override
  ConsumerState<AddCollectionPage> createState() => _AddCollectionPageState();
}

class _AddCollectionPageState extends ConsumerState<AddCollectionPage> {
  static const _suggestedTags = [
    'UTILITY',
    'ARCHIVE',
    'DESIGN',
    'DEVELOPMENT',
    'RESEARCH',
    'PERSONAL',
    'READING',
    'INSPIRATION',
  ];

  final _titleController = TextEditingController();
  final _tagController = TextEditingController();
  final _draftTags = <String>{};
  var _selectedIconKey = 'folder';
  String? _selectedTag;
  var _saving = false;
  int? _hydratedId;

  @override
  void dispose() {
    _titleController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editing = widget.collectionId == null
        ? const AsyncValue<Collection?>.data(null)
        : ref.watch(collectionProvider(widget.collectionId!));
    final persisted =
        ref
            .watch(collectionFiltersProvider)
            .value
            ?.where((tag) => tag != allCollectionsFilter) ??
        const Iterable<String>.empty();
    final tags = {
      ..._suggestedTags,
      ...persisted,
      ..._draftTags,
    }.toList(growable: false);
    editing.whenData(_hydrate);

    return AddCollectionForm(
      sheetMode: widget.sheetMode,
      isEditing: widget.collectionId != null,
      saving: _saving,
      titleController: _titleController,
      selectedIconKey: _selectedIconKey,
      selectedTag: _selectedTag,
      onClose: _close,
      onChooseIcon: _pickIcon,
      onChooseTags: () => _pickTag(tags),
      onSave: _saving ? null : _save,
    );
  }

  void _hydrate(Collection? collection) {
    if (collection == null || _hydratedId == collection.id) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _hydratedId == collection.id) return;
      setState(() {
        _titleController.text = collection.title;
        _selectedIconKey = collection.iconKey;
        _selectedTag = collection.tagName.isEmpty ? null : collection.tagName;
        if (_selectedTag != null) _draftTags.add(_selectedTag!);
        _hydratedId = collection.id;
      });
    });
  }

  Future<void> _pickTag(List<String> tags) {
    return showAddLinkTagsSheet(
      context: context,
      availableTags: tags,
      selectedTags: {?_selectedTag},
      controller: _tagController,
      singleSelection: true,
      onAdd: (rawValue) {
        final tag = normalizeTagName(rawValue);
        if (tag == null) return;
        setState(() {
          _draftTags.add(tag);
          _selectedTag = tag;
          _tagController.clear();
        });
      },
      onToggle: (tag) {
        setState(() => _selectedTag = _selectedTag == tag ? null : tag);
      },
    );
  }

  Future<void> _pickIcon() async {
    final iconKey = await showCollectionIconPickerSheet(
      context: context,
      selectedIconKey: _selectedIconKey,
    );
    if (mounted && iconKey != null) {
      setState(() => _selectedIconKey = iconKey);
    }
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            linkVaultLocalizationsOf(context).collectionNameRequired,
          ),
        ),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final repository = ref.read(collectionsRepositoryProvider);
      final id = widget.collectionId;
      final savedId =
          id ??
          await repository.create(
            title,
            'CUSTOM',
            _selectedIconKey,
            tagName: _selectedTag,
          );
      if (id != null) {
        await repository.update(
          id,
          title,
          'CUSTOM',
          _selectedIconKey,
          tagName: _selectedTag,
        );
      }
      if (mounted) _close(savedId);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  void _close([int? savedId]) {
    if (widget.sheetMode) {
      Navigator.of(context, rootNavigator: true).pop(savedId);
      return;
    }
    context.go('/collections');
  }
}
