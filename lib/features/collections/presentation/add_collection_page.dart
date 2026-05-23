import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/collections/presentation/widget/add_collection_widgets.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';

class AddCollectionPage extends ConsumerStatefulWidget {
  const AddCollectionPage({super.key, this.collectionId});

  final int? collectionId;

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
  final _tagFocusNode = FocusNode();
  final _draftTags = <String>{'UTILITY'};
  var _selectedIconKey = 'folder';
  String? _selectedTag = 'UTILITY';
  var _saving = false;
  int? _hydratedCollectionId;

  @override
  void dispose() {
    _titleController.dispose();
    _tagController.dispose();
    _tagFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editingCollection = widget.collectionId == null
        ? const AsyncValue<Collection?>.data(null)
        : ref.watch(collectionProvider(widget.collectionId!));
    final persistedTags =
        ref
            .watch(collectionFiltersProvider)
            .value
            ?.where((tag) => tag != allCollectionsFilter) ??
        const Iterable<String>.empty();
    final availableTags = {
      ..._suggestedTags,
      ...persistedTags,
      ..._draftTags,
    }.toList(growable: false);

    editingCollection.whenData((collection) {
      if (collection == null || _hydratedCollectionId == collection.id) {
        return;
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _hydratedCollectionId == collection.id) {
          return;
        }

        setState(() {
          _titleController.text = collection.title;
          _selectedIconKey = collection.iconKey;
          _selectedTag = collection.tagName.isEmpty ? null : collection.tagName;
          if (_selectedTag != null) {
            _draftTags.add(_selectedTag!);
          }
          _hydratedCollectionId = collection.id;
        });
      });
    });

    return VelocityPage(
      showAccentSquare: true,
      spacing: 35,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddCollectionPageHeader(onBack: () => _navigateBack(context)),
            const SizedBox(height: 48),
            CollectionSectionTitle(
              title: widget.collectionId == null
                  ? 'NEW_COLLECTION'
                  : 'EDIT_COLLECTION',
            ),
            const SizedBox(height: 25),
            VelocityTextInput(
              hint: 'COLLECTION_NAME...',
              icon: Icons.folder_copy_outlined,
              height: 84,
              borderColor: LinkVaultColors.ink,
              backgroundColor: LinkVaultThemeTokens.surface(context),
              controller: _titleController,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CollectionSectionTitle(title: 'ASSIGN_TAGS'),
            const SizedBox(height: 32),
            Text(
              'NEW_TAG'.displayText,
              style: TextStyle(
                color: LinkVaultThemeTokens.ink(context),
                fontFamily: GoogleFonts.nunito().fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            VelocityTextInput(
              hint: 'ENTER_KEYWORD...',
              borderColor: LinkVaultColors.ink,
              backgroundColor: LinkVaultThemeTokens.surface(context),
              controller: _tagController,
              focusNode: _tagFocusNode,
              onSubmitted: _handleAddTag,
              trailing: GestureDetector(
                onTap: () => _handleAddTag(_tagController.text),
                child: AnimatedBuilder(
                  animation: _tagFocusNode,
                  builder: (context, child) {
                    return Text(
                      'ADD'.displayText,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: _tagFocusNode.hasFocus
                            ? LinkVaultColors.primary
                            : LinkVaultColors.secondary,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final tag in availableTags)
                  VelocityChip(
                    label: tag,
                    selected: _selectedTag == tag,
                    showClose: _selectedTag == tag,
                    onTap: () {
                      setState(() {
                        _selectedTag = _selectedTag == tag ? null : tag;
                      });
                    },
                  ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CollectionSectionTitle(title: 'CHOOSE_ICON'),
            const SizedBox(height: 32),
            CollectionIconSelector(
              selectedIconKey: _selectedIconKey,
              onPressed: _pickIcon,
            ),
          ],
        ),
        VelocityButton(
          label: _saving
              ? (widget.collectionId == null ? 'SAVING...' : 'UPDATING...')
              : (widget.collectionId == null
                    ? 'SAVE_COLLECTION'
                    : 'UPDATE_COLLECTION'),
          icon: Icons.arrow_forward_rounded,
          onPressed: _saving ? null : _save,
        ),
      ],
    );
  }

  void _navigateBack(BuildContext context) {
    final collectionId = widget.collectionId;
    if (collectionId != null) {
      context.go('/collections/view?id=$collectionId');
      return;
    }

    context.go('/collections');
  }

  Future<void> _pickIcon() async {
    final iconKey = await showDialog<String>(
      context: context,
      builder: (context) {
        return CollectionIconPickerDialog(selectedIconKey: _selectedIconKey);
      },
    );

    if (!mounted || iconKey == null) {
      return;
    }

    setState(() {
      _selectedIconKey = iconKey;
    });
  }

  void _handleAddTag(String rawValue) {
    final tag = _normalizeTag(rawValue);
    if (tag == null) {
      return;
    }

    setState(() {
      _draftTags.add(tag);
      _selectedTag = tag;
      _tagController.clear();
    });
  }

  String? _normalizeTag(String rawValue) {
    final trimmed = rawValue.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    final normalized = trimmed
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'[^A-Za-z0-9_]+'), '')
        .toUpperCase();

    return normalized.isEmpty ? null : normalized;
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('COLLECTION_NAME_REQUIRED'.displayText)),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      final repository = ref.read(collectionsRepositoryProvider);
      final collectionId = widget.collectionId;
      if (collectionId == null) {
        await repository.create(
          title,
          'CUSTOM',
          _selectedIconKey,
          tagName: _selectedTag,
        );
      } else {
        await repository.update(
          collectionId,
          title,
          'CUSTOM',
          _selectedIconKey,
          tagName: _selectedTag,
        );
      }
      if (mounted) {
        if (collectionId == null) {
          context.go('/collections');
        } else {
          context.go('/collections/view?id=$collectionId');
        }
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }
}
