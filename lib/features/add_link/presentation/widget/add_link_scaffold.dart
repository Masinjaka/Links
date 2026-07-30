import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class AddLinkScaffold extends StatelessWidget {
  const AddLinkScaffold({
    super.key,
    required this.children,
    required this.bottomAction,
    this.sheetMode = false,
  });

  final List<Widget> children;
  final Widget bottomAction;
  final bool sheetMode;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      children: [
        Expanded(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
            children: children,
          ),
        ),
        SafeArea(
          top: false,
          minimum: const EdgeInsets.fromLTRB(32, 12, 32, 18),
          child: bottomAction,
        ),
      ],
    );

    if (sheetMode) {
      return Material(
        key: const Key('add-link-sheet-surface'),
        color: LinkVaultThemeTokens.background(context),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        clipBehavior: Clip.antiAlias,
        child: content,
      );
    }

    return Scaffold(
      backgroundColor: LinkVaultThemeTokens.background(context),
      body: SafeArea(bottom: false, child: content),
    );
  }
}
