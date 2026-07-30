import 'package:flutter/material.dart';

import 'package:linkvault/features/link_details/presentation/link_details_page.dart';
import 'package:linkvault/shared/presentation/widgets/inset_sheet_geometry.dart';

Future<void> showLinkDetailsSheet({
  required BuildContext context,
  required int linkId,
  int? collectionId,
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
        child: LinkDetailsPage(
          linkId: linkId,
          collectionId: collectionId,
          sheetMode: true,
        ),
      );
    },
  );
}
