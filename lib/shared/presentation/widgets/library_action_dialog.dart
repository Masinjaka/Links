import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

Future<T?> showLibraryActionDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  return showDialog<T>(
    context: context,
    useRootNavigator: true,
    barrierColor: Colors.black.withValues(alpha: .36),
    builder: builder,
  );
}

class LibraryActionDialog extends StatelessWidget {
  const LibraryActionDialog({
    super.key,
    required this.title,
    required this.message,
    required this.secondaryLabel,
    required this.primaryLabel,
    required this.onSecondary,
    required this.onPrimary,
    this.body,
    this.primaryKey,
    this.height,
  });

  final String title;
  final String message;
  final String secondaryLabel;
  final String primaryLabel;
  final VoidCallback onSecondary;
  final VoidCallback onPrimary;
  final Widget? body;
  final Key? primaryKey;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: const Key('library-action-dialog'),
      backgroundColor: LinkVaultThemeTokens.background(context),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: SizedBox(
          key: const Key('library-action-dialog-content'),
          height: height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: Column(
              mainAxisSize: body == null ? MainAxisSize.min : MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  message,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(height: 1.15),
                ),
                if (body == null)
                  const SizedBox(height: 28)
                else ...[
                  const SizedBox(height: 20),
                  Expanded(child: body!),
                  const SizedBox(height: 18),
                ],
                Row(
                  children: [
                    Expanded(
                      child: _action(
                        context,
                        secondaryLabel,
                        onSecondary,
                        false,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _action(
                        context,
                        primaryLabel,
                        onPrimary,
                        true,
                        key: primaryKey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _action(
    BuildContext context,
    String label,
    VoidCallback onPressed,
    bool primary, {
    Key? key,
  }) {
    final background = primary
        ? LinkVaultThemeTokens.primary(context)
        : LinkVaultThemeTokens.surface(context);
    return FilledButton(
      key: key,
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        elevation: 0,
        minimumSize: const Size.fromHeight(40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: background,
        foregroundColor: primary
            ? Colors.white
            : LinkVaultThemeTokens.ink(context),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        textStyle: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
