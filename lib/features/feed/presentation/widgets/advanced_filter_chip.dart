import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_circle_button.dart';

class AdvancedFilterChip extends StatelessWidget {
  const AdvancedFilterChip({
    super.key,
    required this.activeCount,
    required this.onTap,
  });

  final int activeCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LibraryCircleButton(
      icon: Icons.checklist_rounded,
      tooltip: linkVaultLocalizationsOf(context).filterLinks,
      badgeCount: activeCount,
      onPressed: onTap,
    );
  }
}
