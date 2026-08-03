import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class DeleteLinksUndoSnackbarContent extends StatelessWidget {
  const DeleteLinksUndoSnackbarContent({
    super.key,
    required this.message,
    required this.undoLabel,
    required this.onUndo,
  });

  final String message;
  final String undoLabel;
  final VoidCallback onUndo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(fit: FlexFit.loose, child: Text(message)),
        const SizedBox(width: 4),
        TextButton(
          key: const Key('delete-links-undo'),
          onPressed: onUndo,
          style: TextButton.styleFrom(
            foregroundColor: LinkVaultColors.primary,
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: const TextStyle(fontWeight: FontWeight.w800),
          ),
          child: Text(undoLabel),
        ),
      ],
    );
  }
}
