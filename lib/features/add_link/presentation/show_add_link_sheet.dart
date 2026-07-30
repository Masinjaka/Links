import 'package:flutter/material.dart';

import 'package:linkvault/features/add_link/presentation/add_link_page.dart';
import 'package:linkvault/shared/presentation/widgets/inset_sheet_geometry.dart';

Future<void> showAddLinkSheet(
  BuildContext context, {
  int? linkId,
  int? collectionId,
  String? initialUrl,
}) {
  final sheetHeight = insetSheetHeight(context);
  return showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .42),
    builder: (context) {
      return SizedBox(
        height: sheetHeight,
        child: AddLinkPage(
          linkId: linkId,
          collectionId: collectionId,
          initialUrl: initialUrl,
          sheetMode: true,
        ),
      );
    },
  );
}
