import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/domain/duplicate_bookmark_choice.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

Future<DuplicateBookmarkChoice?> showDuplicateBookmarkDialog(
  BuildContext context,
  LinkWithTags existing,
) {
  return showDialog<DuplicateBookmarkChoice>(
    context: context,
    builder: (context) {
      final strings = linkVaultLocalizationsOf(context);
      return AlertDialog(
        backgroundColor: LinkVaultThemeTokens.surface(context),
        title: Text(strings.linkAlreadySaved),
        content: Text(strings.linkAlreadySavedMessage(existing.link.title)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(strings.cancel),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, DuplicateBookmarkChoice.open),
            child: Text(strings.openExisting),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, DuplicateBookmarkChoice.merge),
            child: Text(strings.mergeOrganisation),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(context, DuplicateBookmarkChoice.replace),
            child: Text(strings.replaceMetadata),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(context, DuplicateBookmarkChoice.saveAnyway),
            child: Text(strings.saveAnyway),
          ),
        ],
      );
    },
  );
}
