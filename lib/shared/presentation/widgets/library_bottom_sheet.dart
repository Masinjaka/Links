import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

Future<T?> showLibraryBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  required Key surfaceKey,
  double? height,
  double? heightFactor,
  double handleSpacing = 22,
}) {
  assert(height == null || heightFactor == null);
  return showModalBottomSheet<T>(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .36),
    builder: (context) {
      Widget sheet = LibraryBottomSheetSurface(
        key: surfaceKey,
        handleSpacing: handleSpacing,
        child: builder(context),
      );
      if (height != null) sheet = SizedBox(height: height, child: sheet);
      if (heightFactor != null) {
        sheet = FractionallySizedBox(heightFactor: heightFactor, child: sheet);
      }
      return sheet;
    },
  );
}

class LibraryBottomSheetSurface extends StatelessWidget {
  const LibraryBottomSheetSurface({
    super.key,
    required this.child,
    this.handleSpacing = 22,
  });

  final Widget child;
  final double handleSpacing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: LinkVaultThemeTokens.background(context),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        side: BorderSide(
          color: LinkVaultThemeTokens.secondaryInk(context, alpha: .18),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 9),
          Container(
            width: 36,
            height: 6,
            decoration: BoxDecoration(
              color: LinkVaultThemeTokens.surface(context),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          SizedBox(height: handleSpacing),
          Flexible(child: child),
        ],
      ),
    );
  }
}
