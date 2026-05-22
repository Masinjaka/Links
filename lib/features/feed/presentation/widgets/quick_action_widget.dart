import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:linkvault/shared/presentation/widgets/square_button_widget.dart';

class FeedQuickActions extends StatelessWidget {
  const FeedQuickActions({super.key, this.onAdd, this.onArchive});

  final VoidCallback? onAdd;
  final VoidCallback? onArchive;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final action = onArchive ?? onAdd;
    if (action == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
      right: 32,
      bottom: math.max(24, bottomInset + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SquareButton(
            onPressed: action,
            tooltip: onArchive != null ? 'Archive links' : 'Add link',
            icon: onArchive != null
                ? Icons.archive_outlined
                : Icons.add_rounded,
            shadowed: false,
          ),
        ],
      ),
    );
  }
}
