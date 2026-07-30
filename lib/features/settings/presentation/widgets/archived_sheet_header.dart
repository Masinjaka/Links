import 'package:flutter/material.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class ArchivedSheetHeader extends StatelessWidget {
  const ArchivedSheetHeader({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            linkVaultLocalizationsOf(context).archived.toUpperCase(),
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        IconButton(
          key: const Key('archived-library-close'),
          onPressed: onClose,
          tooltip: linkVaultLocalizationsOf(context).close,
          icon: const Icon(Icons.close_rounded, size: 25),
        ),
      ],
    );
  }
}
