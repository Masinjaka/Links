import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class AddCollectionSaveButton extends StatelessWidget {
  const AddCollectionSaveButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton(
        key: const Key('save-collection-button'),
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: LinkVaultColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: LinkVaultColors.primary.withValues(
            alpha: .55,
          ),
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
