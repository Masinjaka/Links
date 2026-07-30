import 'package:flutter/material.dart';

import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_empty_state.dart';

class FeedEmptyState extends StatelessWidget {
  const FeedEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    return SizedBox(
      key: const Key('feed-empty-state'),
      height: MediaQuery.sizeOf(context).height * .58,
      child: LibraryEmptyState(
        title: localizations.noLinksYet,
        subtitle: localizations.startByAddingSome,
      ),
    );
  }
}
