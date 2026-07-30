import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class AddLinkSaveButton extends StatelessWidget {
  const AddLinkSaveButton({
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
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: LinkVaultColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: LinkVaultColors.primary.withValues(
            alpha: .55,
          ),
          shape: const StadiumBorder(),
          elevation: 0,
          textStyle: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
