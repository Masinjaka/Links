import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_add_link_button.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_details_commands.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_details_title_bar.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_link_selection_strip.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_links_header.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_menu_action.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_options_sheet.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_selection_checkbox.dart';
import 'package:linkvault/features/feed/presentation/widgets/kinetic_link_card.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_empty_state.dart';
import 'package:linkvault/shared/presentation/widgets/selection_action_rail.dart';

class CollectionDetailsBody extends ConsumerStatefulWidget {
  const CollectionDetailsBody({
    super.key,
    required this.collection,
    required this.links,
    required this.sheetMode,
  });

  final CollectionWithCount collection;
  final List<LinkWithTags> links;
  final bool sheetMode;

  @override
  ConsumerState<CollectionDetailsBody> createState() =>
      _CollectionDetailsBodyState();
}

class _CollectionDetailsBodyState extends ConsumerState<CollectionDetailsBody> {
  final _selectedIds = <int>{};
  var _selectionMode = false;

  @override
  void didUpdateWidget(CollectionDetailsBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    final availableIds = widget.links.map((item) => item.link.id).toSet();
    _selectedIds.retainAll(availableIds);
  }

  @override
  Widget build(BuildContext context) {
    final commands = CollectionDetailsCommands(
      context: context,
      ref: ref,
      collection: widget.collection,
      sheetMode: widget.sheetMode,
    );
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final content = Stack(
      children: [
        ListView(
          padding: EdgeInsets.fromLTRB(32, 24, 32, 100 + bottomInset),
          children: [
            CollectionDetailsTitleBar(
              title: widget.collection.collection.title,
              onClose: commands.close,
            ),
            const SizedBox(height: 28),
            CollectionLinksHeader(onOptions: () => _showOptions(commands)),
            CollectionLinkSelectionStrip(
              visible: _selectionMode,
              allSelected:
                  widget.links.isNotEmpty &&
                  _selectedIds.length == widget.links.length,
              onSelectAll: _toggleAll,
              onCancel: _cancelSelection,
            ),
            const SizedBox(height: 28),
            if (widget.links.isEmpty)
              SizedBox(
                key: const Key('collection-empty-state'),
                height: MediaQuery.sizeOf(context).height * .67,
                child: LibraryEmptyState(
                  title: linkVaultLocalizationsOf(context).noLinksYet,
                  subtitle: linkVaultLocalizationsOf(context).startByAddingSome,
                ),
              )
            else
              for (final (index, link) in widget.links.indexed) ...[
                KeyedSubtree(
                  key: ValueKey('collection-detail-link-${link.link.id}'),
                  child: KineticLinkCard(
                    link: link,
                    leading: _selectionMode
                        ? FeedSelectionCheckbox(
                            selected: _selectedIds.contains(link.link.id),
                          )
                        : null,
                    onOpen: _selectionMode
                        ? () => _toggle(link.link.id)
                        : () => commands.openLink(link),
                    onFavourite: () => commands.toggleLinkFavourite(link),
                    onPin: () => commands.toggleLinkPin(link),
                  ),
                ),
                if (index != widget.links.length - 1)
                  const SizedBox(height: 12),
              ],
          ],
        ),
        if (_selectionMode && _selectedIds.isNotEmpty)
          SelectionActionRail(
            actions: [
              (
                'Remove from collection',
                Icons.link_off_rounded,
                _removeSelected,
              ),
            ],
          )
        else if (!_selectionMode)
          Positioned(
            right: 32,
            bottom: 24 + bottomInset,
            child: CollectionAddLinkButton(onPressed: commands.addLink),
          ),
      ],
    );
    return _surface(context, content);
  }

  Widget _surface(BuildContext context, Widget content) {
    if (!widget.sheetMode) {
      return Scaffold(
        backgroundColor: LinkVaultThemeTokens.background(context),
        body: SafeArea(bottom: false, child: content),
      );
    }
    return Material(
      key: const Key('collection-details-sheet-surface'),
      color: LinkVaultThemeTokens.background(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      clipBehavior: Clip.antiAlias,
      child: content,
    );
  }

  void _showOptions(CollectionDetailsCommands commands) {
    showCollectionOptionsSheet(
      context: context,
      collection: widget.collection.collection,
      onSelected: (action) {
        if (action == CollectionMenuAction.selectLinks) {
          setState(() => _selectionMode = true);
          return;
        }
        commands.handleOption(action);
      },
    );
  }

  void _toggle(int id) {
    setState(() {
      _selectedIds.contains(id)
          ? _selectedIds.remove(id)
          : _selectedIds.add(id);
    });
  }

  void _toggleAll() {
    setState(() {
      if (_selectedIds.length == widget.links.length) {
        _selectedIds.clear();
      } else {
        _selectedIds.addAll(widget.links.map((item) => item.link.id));
      }
    });
  }

  void _cancelSelection() {
    setState(() {
      _selectionMode = false;
      _selectedIds.clear();
    });
  }

  Future<void> _removeSelected() async {
    final ids = _selectedIds.toSet();
    await ref
        .read(collectionsRepositoryProvider)
        .removeLinks(widget.collection.collection.id, ids);
    if (!mounted) return;
    setState(_selectedIds.clear);
  }
}
