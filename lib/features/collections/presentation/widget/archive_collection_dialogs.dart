part of 'collection_details_widgets.dart';

Future<bool> showArchiveCollectionDialog(
  BuildContext context,
  String collectionTitle,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) {
      final ink = LinkVaultThemeTokens.ink(context);
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: LinkVaultThemeTokens.surface(context),
            borderRadius: LinkVaultThemeTokens.componentRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ARCHIVE_COLLECTION',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Archive "$collectionTitle"? Links will stay in the vault, but they will be removed from this collection.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: VelocityButton(
                      label: 'CANCEL',
                      filled: false,
                      borderColor: ink,
                      foregroundColor: ink,
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: VelocityButton(
                      label: 'ARCHIVE',
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  return confirmed == true;
}

Future<bool> showArchiveCollectionsDialog(
  BuildContext context,
  int selectionCount,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) {
      final ink = LinkVaultThemeTokens.ink(context);
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: LinkVaultThemeTokens.surface(context),
            borderRadius: LinkVaultThemeTokens.componentRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ARCHIVE_COLLECTIONS',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Archive $selectionCount selected collection${selectionCount == 1 ? '' : 's'}? Links will stay in the vault, but they will be removed from those collections.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: VelocityButton(
                      label: 'CANCEL',
                      filled: false,
                      borderColor: ink,
                      foregroundColor: ink,
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: VelocityButton(
                      label: 'ARCHIVE',
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  return confirmed == true;
}
