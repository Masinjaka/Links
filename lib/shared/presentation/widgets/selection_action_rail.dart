import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class SelectionActionRail extends StatelessWidget {
  const SelectionActionRail({super.key, required this.actions});

  final List<(String, IconData, VoidCallback)> actions;

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) return const SizedBox.shrink();

    return Positioned(
      right: 32,
      bottom: math.max(24, MediaQuery.paddingOf(context).bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final (index, action) in actions.indexed) ...[
            Tooltip(
              message: action.$1,
              child: Material(
                key: Key('selection-action-$index'),
                color: LinkVaultColors.primary,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: action.$3,
                  child: SizedBox.square(
                    dimension: 52,
                    child: Icon(
                      action.$2,
                      size: 26,
                      color: LinkVaultColors.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            if (index != actions.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
