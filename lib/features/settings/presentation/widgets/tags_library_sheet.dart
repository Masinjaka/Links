import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/settings/presentation/widgets/managed_tags_list.dart';
import 'package:linkvault/features/settings/presentation/widgets/tags_library_tabs.dart';
import 'package:linkvault/features/settings/presentation/widgets/tags_library_toolbar.dart';
import 'package:linkvault/features/settings/presentation/widgets/tags_selection_action.dart';
import 'package:linkvault/features/settings/presentation/widgets/tags_sheet_header.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/features/settings/provider/settings_tag_providers.dart';
import 'package:linkvault/features/settings/repository/managed_tag.dart';
import 'package:linkvault/shared/presentation/widgets/library_confirmation_dialog.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class TagsLibrarySheet extends ConsumerStatefulWidget {
  const TagsLibrarySheet({super.key});

  @override
  ConsumerState<TagsLibrarySheet> createState() => _TagsLibrarySheetState();
}

class _TagsLibrarySheetState extends ConsumerState<TagsLibrarySheet> {
  var tab = TagsLibraryTab.links;
  var query = '';
  var selectionMode = false;
  final selectedLinkTags = <String>{};
  final selectedCollectionTags = <String>{};

  @override
  Widget build(BuildContext context) {
    final source = tab == TagsLibraryTab.links
        ? ref.watch(managedLinkTagsProvider)
        : ref.watch(managedCollectionTagsProvider);
    final tags = source.whenData(_filter);
    final visibleNames =
        tags.value?.map((tag) => tag.name).toList(growable: false) ??
        const <String>[];
    final allSelected =
        visibleNames.isNotEmpty && visibleNames.every(_selectedNames.contains);

    return Material(
      key: const Key('tags-library-sheet'),
      color: LinkVaultThemeTokens.background(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 25, 22, 0),
                child: TagsSheetHeader(
                  onClose: () => Navigator.of(context).pop(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TagsLibraryTabs(selected: tab, onSelected: _selectTab),
              ),
              const SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TagsLibraryToolbar(
                  selectionMode: selectionMode,
                  allSelected: allSelected,
                  onSearchChanged: (value) => setState(() => query = value),
                  onSelectAll: () => _toggleAll(visibleNames, allSelected),
                  onCancelSelection: _cancelSelection,
                  onStartSelection: () {
                    setState(() => selectionMode = true);
                  },
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween(
                        begin: const Offset(.025, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                  child: ManagedTagsList(
                    key: ValueKey(tab),
                    tags: tags,
                    assetLabel: tab == TagsLibraryTab.links
                        ? linkVaultLocalizationsOf(context).linkSingular
                        : linkVaultLocalizationsOf(context).collectionSingular,
                    selectionMode: selectionMode,
                    selectedNames: _selectedNames,
                    onToggle: _toggleSelection,
                  ),
                ),
              ),
            ],
          ),
          if (selectionMode) TagsSelectionAction(onDelete: _deleteSelected),
        ],
      ),
    );
  }

  List<ManagedTag> _filter(List<ManagedTag> tags) {
    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return tags;
    return tags
        .where((tag) => tag.name.toLowerCase().contains(needle))
        .toList(growable: false);
  }

  Set<String> get _selectedNames =>
      tab == TagsLibraryTab.links ? selectedLinkTags : selectedCollectionTags;

  void _selectTab(TagsLibraryTab value) => setState(() {
    tab = value;
    query = '';
    selectionMode = false;
    selectedLinkTags.clear();
    selectedCollectionTags.clear();
  });

  void _toggleSelection(String name) => setState(() {
    selectionMode = true;
    _selectedNames.contains(name)
        ? _selectedNames.remove(name)
        : _selectedNames.add(name);
  });

  void _toggleAll(List<String> names, bool allSelected) => setState(() {
    allSelected
        ? _selectedNames.removeAll(names)
        : _selectedNames.addAll(names);
  });

  void _cancelSelection() => setState(() {
    selectionMode = false;
    selectedLinkTags.clear();
    selectedCollectionTags.clear();
  });

  Future<void> _deleteSelected() async {
    final names = {..._selectedNames};
    if (names.isEmpty) return;
    final confirmed = await showLibraryConfirmationDialog(
      context: context,
      title: linkVaultLocalizationsOf(context).delete,
      message: linkVaultLocalizationsOf(
        context,
      ).deleteTagsMessage(names.length),
      primaryLabel: linkVaultLocalizationsOf(context).delete,
      primaryKey: const Key('confirm-delete-tags'),
    );
    if (!confirmed) return;
    final repository = ref.read(settingsRepositoryProvider);
    if (tab == TagsLibraryTab.links) {
      await repository.deleteLinkTags(names);
      ref.read(addLinkOptimisticTagsProvider.notifier).removeAll(names);
      if (names.contains(ref.read(selectedFeedFilterProvider))) {
        ref.read(selectedFeedFilterProvider.notifier).select(allAssetsFilter);
      }
    } else {
      await repository.deleteCollectionTags(names);
      if (names.contains(ref.read(selectedCollectionTagProvider))) {
        ref
            .read(selectedCollectionTagProvider.notifier)
            .select(allCollectionsFilter);
      }
    }
    if (mounted) setState(_selectedNames.clear);
  }
}
