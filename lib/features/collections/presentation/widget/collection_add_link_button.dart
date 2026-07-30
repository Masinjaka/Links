import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class CollectionAddLinkButton extends StatelessWidget {
  const CollectionAddLinkButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: LinkVaultColors.primary,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: const Key('collection-details-add-link'),
        onTap: onPressed,
        child: const SizedBox.square(
          dimension: 56,
          child: Icon(Icons.add_rounded, color: Colors.white, size: 34),
        ),
      ),
    );
  }
}
