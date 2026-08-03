import 'package:flutter/material.dart';

import 'package:linkvault/features/add_link/presentation/widget/add_link_save_button.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class AddLinkCollectionEmptyState extends StatelessWidget {
  const AddLinkCollectionEmptyState({
    super.key,
    required this.onCreateCollection,
  });

  final VoidCallback onCreateCollection;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 180,
        child: AddLinkSaveButton(
          key: const Key('add-link-create-collection'),
          label: linkVaultLocalizationsOf(context).createCollection,
          onPressed: onCreateCollection,
        ),
      ),
    );
  }
}
