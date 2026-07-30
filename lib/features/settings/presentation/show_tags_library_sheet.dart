import 'package:flutter/material.dart';

import 'package:linkvault/features/settings/presentation/widgets/tags_library_sheet.dart';
import 'package:linkvault/shared/presentation/widgets/inset_sheet_geometry.dart';

Future<void> showTagsLibrarySheet(BuildContext context) {
  final sheetHeight = insetSheetHeight(context);
  return showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .36),
    builder: (_) =>
        SizedBox(height: sheetHeight, child: const TagsLibrarySheet()),
  );
}
