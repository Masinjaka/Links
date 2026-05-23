part of 'link_details_widgets.dart';

Future<bool> showArchiveLinkDialog(
  BuildContext context,
  String linkTitle,
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
                'ARCHIVE_LINK'.displayText,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Archive "$linkTitle"? It will be removed from active links and moved to archive.',
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
