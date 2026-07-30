import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/features/link_details/presentation/show_link_details_sheet.dart';

void closeAddLink(
  BuildContext context, {
  required bool sheetMode,
  int? editingId,
  int? collectionId,
}) {
  if (sheetMode) {
    Navigator.of(context, rootNavigator: true).pop();
    return;
  }
  if (editingId != null && collectionId != null) {
    context.go('/details?id=$editingId&collectionId=$collectionId');
    return;
  }
  context.go('/');
}

void completeAddLink(
  BuildContext context, {
  required bool sheetMode,
  required int linkId,
  int? collectionId,
}) {
  final suffix = collectionId == null ? '' : '&collectionId=$collectionId';
  final destination = '/details?id=$linkId$suffix';
  if (!sheetMode) {
    context.go(destination);
    return;
  }
  final navigator = Navigator.of(context, rootNavigator: true);
  final rootContext = navigator.context;
  navigator.pop();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!rootContext.mounted) return;
    showLinkDetailsSheet(
      context: rootContext,
      linkId: linkId,
      collectionId: collectionId,
    );
  });
}
