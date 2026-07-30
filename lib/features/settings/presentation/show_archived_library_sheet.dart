import 'package:flutter/material.dart';

import 'package:linkvault/features/settings/presentation/widgets/archived_library_sheet.dart';
import 'package:linkvault/shared/presentation/widgets/inset_sheet_geometry.dart';

Future<void> showArchivedLibrarySheet(BuildContext context) {
  final sheetHeight = insetSheetHeight(context);
  return showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .36),
    builder: (_) =>
        SizedBox(height: sheetHeight, child: const ArchivedLibrarySheet()),
  );
}
