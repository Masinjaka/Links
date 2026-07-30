import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/link_details/presentation/widget/link_details_widgets.dart';
import 'package:linkvault/features/link_details/provider/link_details_providers.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class LinkDetailsPage extends ConsumerWidget {
  const LinkDetailsPage({
    super.key,
    this.linkId,
    this.collectionId,
    this.sheetMode = false,
  });

  final int? linkId;
  final int? collectionId;
  final bool sheetMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final linkAsync = ref.watch(linkDetailsProvider(linkId));

    return linkAsync.when(
      data: (link) => link == null
          ? const EmptyDetailsState()
          : LinkDetailsBody(
              link: link,
              collectionId: collectionId,
              sheetMode: sheetMode,
            ),
      error: (error, stackTrace) => Scaffold(
        backgroundColor: LinkVaultThemeTokens.background(context),
        body: Stack(
          children: [
            const Positioned.fill(
              child: IgnorePointer(child: VelocityKineticBackground()),
            ),
            Center(
              child: Text(
                linkVaultLocalizationsOf(context).databaseError,
                style: textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
      loading: () => Scaffold(
        backgroundColor: LinkVaultThemeTokens.background(context),
        body: Stack(
          children: [
            Positioned.fill(
              child: IgnorePointer(child: VelocityKineticBackground()),
            ),
            Center(
              child: CircularProgressIndicator(color: LinkVaultColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
