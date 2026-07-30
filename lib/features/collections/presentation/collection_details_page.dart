import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_details_body.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class CollectionDetailsPage extends ConsumerWidget {
  const CollectionDetailsPage({
    super.key,
    required this.collectionId,
    this.sheetMode = false,
  });

  final int collectionId;
  final bool sheetMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collection = ref.watch(collectionProvider(collectionId));
    final links = ref.watch(collectionLinksProvider(collectionId));
    return collection.when(
      data: (value) {
        if (value == null) {
          return _state(
            context,
            linkVaultLocalizationsOf(context).collectionNotFound,
          );
        }
        return links.when(
          data: (items) => CollectionDetailsBody(
            collection: CollectionWithCount(
              collection: value,
              count: items.length,
            ),
            links: items,
            sheetMode: sheetMode,
          ),
          error: (_, _) =>
              _state(context, linkVaultLocalizationsOf(context).databaseError),
          loading: () => _state(context, null),
        );
      },
      error: (_, _) =>
          _state(context, linkVaultLocalizationsOf(context).databaseError),
      loading: () => _state(context, null),
    );
  }

  Widget _state(BuildContext context, String? message) {
    final child = Center(
      child: message == null
          ? CircularProgressIndicator(color: LinkVaultColors.primary)
          : Text(message),
    );
    if (sheetMode) {
      return Material(
        color: LinkVaultThemeTokens.background(context),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        clipBehavior: Clip.antiAlias,
        child: child,
      );
    }
    return Scaffold(
      backgroundColor: LinkVaultThemeTokens.background(context),
      body: child,
    );
  }
}
