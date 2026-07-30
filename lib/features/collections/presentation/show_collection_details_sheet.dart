import 'package:flutter/material.dart';

import 'package:linkvault/features/collections/presentation/collection_details_page.dart';
import 'package:linkvault/shared/presentation/widgets/inset_sheet_geometry.dart';

Future<void> showCollectionDetailsSheet({
  required BuildContext context,
  required int collectionId,
}) {
  final sheetHeight = insetSheetHeight(context);
  return showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .42),
    builder: (_) {
      return SizedBox(
        height: sheetHeight,
        child: CollectionDetailsPage(
          collectionId: collectionId,
          sheetMode: true,
        ),
      );
    },
  );
}
