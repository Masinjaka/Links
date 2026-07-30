import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_selection_checkbox.dart';
import 'package:linkvault/features/feed/presentation/widgets/kinetic_link_card.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_pill_text_field.dart';

Future<List<int>?> showCollectionLinkPickerSheet({
  required BuildContext context,
  required int collectionId,
}) {
  return showModalBottomSheet<List<int>>(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .36),
    builder: (_) {
      return FractionallySizedBox(
        heightFactor: .83,
        child: CollectionLinkPickerSheet(collectionId: collectionId),
      );
    },
  );
}

class CollectionLinkPickerSheet extends ConsumerStatefulWidget {
  const CollectionLinkPickerSheet({super.key, required this.collectionId});
  final int collectionId;

  @override
  ConsumerState<CollectionLinkPickerSheet> createState() =>
      _CollectionLinkPickerSheetState();
}

class _CollectionLinkPickerSheetState
    extends ConsumerState<CollectionLinkPickerSheet> {
  final _searchController = TextEditingController();
  final _selectedIds = <int>{};
  var _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    final links = ref.watch(
      availableCollectionLinksProvider(widget.collectionId),
    );
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return Material(
      key: const Key('collection-link-picker-sheet'),
      color: LinkVaultThemeTokens.background(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 10, 32, 16 + bottomInset),
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
            _header(context),
            const SizedBox(height: 20),
            LibraryPillTextField(
              controller: _searchController,
              fieldKey: const Key('collection-link-search'),
              hintText: localizations.searchLink,
              fontSize: 12,
              unfocusOnTapOutside: false,
              onChanged: (value) => setState(() => _query = value),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: links.when(
                data: (items) => _list(_filter(items)),
                error: (_, _) =>
                    Center(child: Text(localizations.databaseError)),
                loading: () => Center(
                  child: CircularProgressIndicator(
                    color: LinkVaultColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final count = _selectedIds.length;
    final localizations = linkVaultLocalizationsOf(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            localizations.selectLinks,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        TextButton(
          key: const Key('collection-link-picker-done'),
          onPressed: () {
            Navigator.of(context).pop(_selectedIds.toList(growable: false));
          },
          style: TextButton.styleFrom(foregroundColor: LinkVaultColors.primary),
          child: Text(localizations.selectedDone(count)),
        ),
      ],
    );
  }

  Widget _list(List<LinkWithTags> links) {
    if (links.isEmpty) {
      return Center(
        child: Text(linkVaultLocalizationsOf(context).noAvailableLinks),
      );
    }
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: links.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final link = links[index];
        final id = link.link.id;
        final selected = _selectedIds.contains(id);
        return KeyedSubtree(
          key: ValueKey('collection-link-choice-$id'),
          child: KineticLinkCard(
            link: link,
            leading: selected
                ? const FeedSelectionCheckbox(selected: true)
                : null,
            onOpen: () => _toggle(id),
            onFavourite: () => _toggleFavourite(link),
            onPin: () => _togglePin(link),
          ),
        );
      },
    );
  }

  List<LinkWithTags> _filter(List<LinkWithTags> links) {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return links;
    return links
        .where((item) {
          return item.link.title.toLowerCase().contains(query) ||
              item.link.displayUrl.toLowerCase().contains(query) ||
              item.tags.any((tag) => tag.name.toLowerCase().contains(query));
        })
        .toList(growable: false);
  }

  void _toggle(int id) {
    setState(() {
      _selectedIds.contains(id)
          ? _selectedIds.remove(id)
          : _selectedIds.add(id);
    });
  }

  Future<void> _toggleFavourite(LinkWithTags link) {
    return ref.read(feedRepositoryProvider).setFavourite([
      link.link.id,
    ], !link.link.isFavourite);
  }

  Future<void> _togglePin(LinkWithTags link) {
    return ref.read(feedRepositoryProvider).setPinned([
      link.link.id,
    ], !link.link.isPinned);
  }
}
