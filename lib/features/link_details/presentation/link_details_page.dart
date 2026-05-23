import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/link_details/presentation/widget/link_details_widgets.dart';
import 'package:linkvault/features/link_details/provider/link_details_providers.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';

class LinkDetailsPage extends ConsumerWidget {
  const LinkDetailsPage({super.key, this.linkId, this.collectionId});

  final int? linkId;
  final int? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final linkAsync = ref.watch(linkDetailsProvider(linkId));

    return linkAsync.when(
      data: (link) => link == null
          ? const EmptyDetailsState()
          : LinkDetailsBody(link: link, collectionId: collectionId),
      error: (error, stackTrace) => Scaffold(
        backgroundColor: LinkVaultThemeTokens.background(context),
        body: Stack(
          children: [
            const Positioned.fill(
              child: IgnorePointer(child: VelocityKineticBackground()),
            ),
            Center(
              child: Text(
                'DATABASE_ERROR'.displayText,
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
