import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_empty_state.dart';

class CollectionsEmptyState extends StatelessWidget {
  const CollectionsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    return SizedBox(
      key: const Key('collections-empty-state'),
      height: MediaQuery.sizeOf(context).height * .58,
      child: LibraryEmptyState(
        title: localizations.noCollectionsYet,
        subtitle: localizations.startByAddingSome,
      ),
    );
  }
}
