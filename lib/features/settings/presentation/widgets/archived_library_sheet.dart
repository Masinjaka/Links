import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/feed/domain/bookmark_state.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_bulk_commands.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_collections_list.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_library_tabs.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_library_toolbar.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_links_list.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_selection_actions.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_sheet_header.dart';
import 'package:linkvault/features/settings/presentation/widgets/archived_sort_button.dart';
import 'package:linkvault/features/settings/provider/archived_library_providers.dart';

class ArchivedLibrarySheet extends ConsumerStatefulWidget {
  const ArchivedLibrarySheet({super.key});

  @override
  ConsumerState<ArchivedLibrarySheet> createState() =>
      _ArchivedLibrarySheetState();
}

class _ArchivedLibrarySheetState extends ConsumerState<ArchivedLibrarySheet> {
  var tab = ArchivedLibraryTab.collections;
  var query = '';
  var selectedFilter = allCollectionsFilter;
  var linkSort = FeedSort.recentlyAdded;
  var collectionSort = CollectionSort.recentlyCreated;
  var selectionMode = false;
  final selectedLinkIds = <int>{};
  final selectedCollectionIds = <int>{};

  @override
  Widget build(BuildContext context) {
    final archivedCollections = ref.watch(archivedCollectionsProvider);
    final linkTags =
        ref.watch(addLinkAvailableTagsProvider).value ?? const <String>[];
    final collectionTags =
        archivedCollections.value
            ?.map((item) => item.collection.tagName)
            .where((tag) => tag.trim().isNotEmpty)
            .toSet()
            .toList() ??
        const <String>[];
    final filters = tab == ArchivedLibraryTab.links
        ? [allAssetsFilter, ...linkTags.where((tag) => !_isArchiveTag(tag))]
        : [allCollectionsFilter, ...collectionTags];
    final links = ref.watch(
      archivedLinksProvider((
        text: query,
        tag: selectedFilter == allAssetsFilter ? null : selectedFilter,
        sort: linkSort,
      )),
    );
    final visibleIds = tab == ArchivedLibraryTab.links
        ? (links.value ?? const []).map((item) => item.link.id).toList()
        : visibleArchivedCollections(
            archivedCollections.value ?? const [],
            query: query,
            selectedTag: selectedFilter,
            sort: collectionSort,
          ).map((item) => item.collection.id).toList();
    final selectedIds = _selectedIds;
    final allSelected =
        visibleIds.isNotEmpty &&
        visibleIds.every((id) => selectedIds.contains(id));

    return Material(
      key: const Key('archived-library-sheet'),
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
                child: ArchivedSheetHeader(
                  onClose: () => Navigator.of(context).pop(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ArchivedLibraryTabs(
                  selected: tab,
                  onSelected: _selectTab,
                ),
              ),
              const SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ArchivedLibraryToolbar(
                  filters: filters,
                  selectedFilter: selectedFilter,
                  onFilterSelected: (value) {
                    setState(() => selectedFilter = value);
                  },
                  onSearchChanged: (value) => setState(() => query = value),
                  sortButton: ArchivedSortButton(
                    tab: tab,
                    linkSort: linkSort,
                    collectionSort: collectionSort,
                    onLinkSort: (value) => setState(() => linkSort = value),
                    onCollectionSort: (value) {
                      setState(() => collectionSort = value);
                    },
                  ),
                  selectionMode: selectionMode,
                  allSelected: allSelected,
                  onSelectAll: () => _toggleAll(visibleIds, allSelected),
                  onCancelSelection: _cancelSelection,
                  onStartSelection: () => setState(() => selectionMode = true),
                ),
              ),
              Expanded(
                child: tab == ArchivedLibraryTab.links
                    ? ArchivedLinksList(
                        links: links,
                        selectionMode: selectionMode,
                        selectedIds: selectedLinkIds,
                        onToggleSelection: _toggleSelection,
                      )
                    : ArchivedCollectionsList(
                        collections: archivedCollections,
                        query: query,
                        selectedTag: selectedFilter,
                        sort: collectionSort,
                        selectionMode: selectionMode,
                        selectedIds: selectedCollectionIds,
                        onToggleSelection: _toggleSelection,
                      ),
              ),
            ],
          ),
          if (selectionMode)
            ArchivedSelectionActions(
              onRestore: _restoreSelected,
              onDelete: _deleteSelected,
            ),
        ],
      ),
    );
  }

  void _selectTab(ArchivedLibraryTab value) {
    setState(() {
      tab = value;
      query = '';
      selectionMode = false;
      selectedLinkIds.clear();
      selectedCollectionIds.clear();
      selectedFilter = value == ArchivedLibraryTab.links
          ? allAssetsFilter
          : allCollectionsFilter;
    });
  }

  Set<int> get _selectedIds =>
      tab == ArchivedLibraryTab.links ? selectedLinkIds : selectedCollectionIds;
  void _toggleSelection(int id) => setState(() {
    selectionMode = true;
    _selectedIds.contains(id) ? _selectedIds.remove(id) : _selectedIds.add(id);
  });

  void _toggleAll(List<int> ids, bool allSelected) => setState(() {
    allSelected ? _selectedIds.removeAll(ids) : _selectedIds.addAll(ids);
  });

  void _cancelSelection() => setState(() {
    selectionMode = false;
    selectedLinkIds.clear();
    selectedCollectionIds.clear();
  });

  Future<void> _restoreSelected() async {
    final ids = {..._selectedIds};
    if (ids.isEmpty) return;
    await restoreArchivedItems(ref, tab, ids);
    if (mounted) setState(_selectedIds.clear);
  }

  Future<void> _deleteSelected() async {
    final ids = {..._selectedIds};
    if (ids.isEmpty) return;
    final deleted = await deleteArchivedItems(context, ref, tab, ids);
    if (deleted && mounted) setState(_selectedIds.clear);
  }

  bool _isArchiveTag(String value) {
    final normalized = value.trim().toUpperCase();
    return normalized == archiveFilter || normalized == 'ARCHIVED';
  }
}
