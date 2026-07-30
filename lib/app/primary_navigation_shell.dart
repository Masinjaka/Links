import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/widgets/primary_add_button.dart';
import 'package:linkvault/app/widgets/primary_add_menu.dart';
import 'package:linkvault/app/widgets/primary_navigation_bar.dart';
import 'package:linkvault/features/add_link/presentation/show_add_link_sheet.dart';
import 'package:linkvault/features/collections/presentation/show_add_collection_sheet.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';

class PrimaryNavigationShell extends ConsumerStatefulWidget {
  const PrimaryNavigationShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<PrimaryNavigationShell> createState() =>
      _PrimaryNavigationShellState();
}

class _PrimaryNavigationShellState
    extends ConsumerState<PrimaryNavigationShell> {
  var _addMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final selecting =
        ref.watch(feedSelectionModeProvider) ||
        ref.watch(collectionSelectionModeProvider);
    final settings = widget.navigationShell.currentIndex == 2;

    return Scaffold(
      extendBody: true,
      body: widget.navigationShell,
      bottomNavigationBar: selecting
          ? null
          : SafeArea(
              top: false,
              minimum: const EdgeInsets.fromLTRB(36, 0, 36, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    reverseDuration: const Duration(milliseconds: 180),
                    transitionBuilder: (child, animation) {
                      final offset = Tween(
                        begin: const Offset(0, .18),
                        end: Offset.zero,
                      ).animate(animation);
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(position: offset, child: child),
                      );
                    },
                    child: settings && _addMenuOpen
                        ? PrimaryAddMenu(
                            onAddLink: _openAddLink,
                            onAddCollection: _openAddCollection,
                          )
                        : const SizedBox.shrink(),
                  ),
                  if (settings && _addMenuOpen) const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryNavigationBar(
                          currentIndex: widget.navigationShell.currentIndex,
                          onDestinationSelected: _goTo,
                        ),
                      ),
                      const SizedBox(width: 12),
                      PrimaryAddButton(
                        expanded: settings && _addMenuOpen,
                        onPressed: () => _handleAdd(settings),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  void _goTo(int index) {
    if (_addMenuOpen) setState(() => _addMenuOpen = false);
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  void _handleAdd(bool settings) {
    if (settings) {
      setState(() => _addMenuOpen = !_addMenuOpen);
      return;
    }
    if (widget.navigationShell.currentIndex == 1) {
      showAddCollectionSheet(context);
      return;
    }
    showAddLinkSheet(context);
  }

  void _openAddLink() {
    setState(() => _addMenuOpen = false);
    showAddLinkSheet(context);
  }

  void _openAddCollection() {
    setState(() => _addMenuOpen = false);
    showAddCollectionSheet(context);
  }
}
