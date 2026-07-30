import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/presentation/widget/collections_widgets.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_pill_text_field.dart';

Future<void> showAddLinkCollectionSheet({
  required BuildContext context,
  required List<CollectionWithCount> collections,
  required int? selectedCollectionId,
  required ValueChanged<int?> onDone,
}) {
  return showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .36),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: .66,
        child: AddLinkCollectionSheet(
          collections: collections,
          selectedCollectionId: selectedCollectionId,
          onDone: onDone,
        ),
      );
    },
  );
}

class AddLinkCollectionSheet extends StatefulWidget {
  const AddLinkCollectionSheet({
    super.key,
    required this.collections,
    required this.selectedCollectionId,
    required this.onDone,
  });

  final List<CollectionWithCount> collections;
  final int? selectedCollectionId;
  final ValueChanged<int?> onDone;

  @override
  State<AddLinkCollectionSheet> createState() => _AddLinkCollectionSheetState();
}

class _AddLinkCollectionSheetState extends State<AddLinkCollectionSheet> {
  final _searchController = TextEditingController();
  late int? _selectedId = widget.selectedCollectionId;
  var _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final collections = widget.collections.where(_matches).toList();
    return Material(
      key: const Key('add-link-collection-sheet'),
      color: LinkVaultThemeTokens.background(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 10, 32, 20 + bottomInset),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 6,
                decoration: BoxDecoration(
                  color: LinkVaultThemeTokens.surface(context),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: Text(
                    linkVaultLocalizationsOf(context).selectCollection,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  key: const Key('add-link-collection-done'),
                  onPressed: _finish,
                  style: TextButton.styleFrom(
                    foregroundColor: LinkVaultColors.primary,
                  ),
                  child: Text(linkVaultLocalizationsOf(context).done),
                ),
              ],
            ),
            const SizedBox(height: 20),
            LibraryPillTextField(
              controller: _searchController,
              fieldKey: const Key('add-link-collection-search'),
              hintText: linkVaultLocalizationsOf(context).searchCollection,
              fontSize: 12,
              unfocusOnTapOutside: false,
              onChanged: (value) => setState(() => _query = value),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: collections.isEmpty
                  ? Center(
                      child: Text(
                        linkVaultLocalizationsOf(context).noCollectionsFound,
                      ),
                    )
                  : ListView.separated(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: collections.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 14),
                      itemBuilder: (context, index) {
                        final group = collections[index];
                        final id = group.collection.id;
                        final selected = id == _selectedId;
                        return KeyedSubtree(
                          key: ValueKey('add-link-collection-$id'),
                          child: CollectionFeedCard(
                            group: group,
                            selected: selected,
                            selectionMode: selected,
                            onOpen: () => _toggle(id),
                            onToggleSelection: () => _toggle(id),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggle(int id) {
    setState(() => _selectedId = _selectedId == id ? null : id);
  }

  void _finish() {
    widget.onDone(_selectedId);
    Navigator.of(context).pop();
  }

  bool _matches(CollectionWithCount group) {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return true;
    final collection = group.collection;
    return collection.title.toLowerCase().contains(query) ||
        collection.type.toLowerCase().contains(query) ||
        collection.tagName.toLowerCase().contains(query) ||
        group.description.toLowerCase().contains(query);
  }
}
