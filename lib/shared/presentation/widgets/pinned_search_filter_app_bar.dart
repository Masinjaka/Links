import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class PinnedSearchFilterAppBar extends StatelessWidget {
  const PinnedSearchFilterAppBar({
    super.key,
    required this.search,
    required this.filters,
    this.action,
  });

  static const double controlsHeight = 144;

  final Widget search;
  final Widget filters;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      primary: false,
      automaticallyImplyLeading: false,
      backgroundColor: LinkVaultThemeTokens.background(context),
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(controlsHeight),
        child: SizedBox(
          height: controlsHeight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36, 28, 36, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: search),
                    if (action != null) ...[const SizedBox(width: 10), action!],
                  ],
                ),
                const SizedBox(height: 28),
                filters,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
