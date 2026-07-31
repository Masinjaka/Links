import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/widgets/glass_surface.dart';

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
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final glass = constraints.scrollOffset > .5;
        final background = LinkVaultThemeTokens.background(context);
        return SliverAppBar(
          pinned: true,
          primary: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(controlsHeight),
            child: GlassSurface(
              enabled: glass,
              borderRadius: BorderRadius.zero,
              color: background,
              glassColor: background.withValues(alpha: .72),
              height: controlsHeight,
              backdropKey: const Key('pinned-header-backdrop'),
              surfaceKey: const Key('pinned-header-surface'),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(36, 28, 36, 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: search),
                        if (action != null) ...[
                          const SizedBox(width: 10),
                          action!,
                        ],
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
      },
    );
  }
}
