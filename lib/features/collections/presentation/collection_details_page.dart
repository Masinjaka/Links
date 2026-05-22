import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/presentation/widget/add_collection_widgets.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_details_widgets.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';

class CollectionDetailsPage extends ConsumerWidget {
  const CollectionDetailsPage({super.key, required this.collectionId});

  final int collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionAsync = ref.watch(collectionProvider(collectionId));
    final linksAsync = ref.watch(collectionLinksProvider(collectionId));
    final textTheme = Theme.of(context).textTheme;

    return collectionAsync.when(
      data: (collection) {
        if (collection == null) {
          return const _EmptyCollectionDetailsState();
        }

        return linksAsync.when(
          data: (links) {
            final snapshot = CollectionWithCount(
              collection: collection,
              count: links.length,
            );

            return Scaffold(
              backgroundColor: LinkVaultThemeTokens.background(context),
              body: Stack(
                children: [
                  const Positioned.fill(
                    child: IgnorePointer(child: VelocityKineticBackground()),
                  ),
                  ListView(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 120),
                    children: [
                      CollectionDetailsHeader(
                        collection: snapshot,
                        onBack: () => context.go('/collections'),
                        onEdit: () =>
                            context.go('/collections/add?id=$collectionId'),
                        onArchive: () =>
                            _archiveCollection(context, ref, snapshot),
                      ),
                      const SizedBox(height: 48),
                      Row(
                        children: [
                          Expanded(
                            child: const CollectionSectionTitle(
                              title: 'COLLECTION_LINKS',
                            ),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () => _addExistingLink(context, ref),
                            style: TextButton.styleFrom(
                              foregroundColor: LinkVaultColors.primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text('+ ADD_LINKS'),
                          ),
                          //
                        ],
                      ),
                      const SizedBox(height: 32),
                      if (links.isEmpty)
                        VelocityPanel(
                          backgroundColor: LinkVaultThemeTokens.surface(
                            context,
                          ),
                          child: const Text('NO_LINKS_IN_COLLECTION'),
                        )
                      else ...[
                        for (final (index, link) in links.indexed) ...[
                          CollectionLinkEntry(
                            link: link,
                            onOpen: () => context.go(
                              '/details?id=${link.link.id}&collectionId=$collectionId',
                            ),
                            onRemove: () => _removeLink(ref, link.link.id),
                          ),
                          if (index != links.length - 1)
                            const SizedBox(height: 16),
                        ],
                      ],
                    ],
                  ),
                ],
              ),
            );
          },
          error: (_, _) => Scaffold(
            backgroundColor: LinkVaultThemeTokens.background(context),
            body: Stack(
              children: [
                const Positioned.fill(
                  child: IgnorePointer(child: VelocityKineticBackground()),
                ),
                Center(
                  child: Text('DATABASE_ERROR', style: textTheme.labelLarge),
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
                  child: CircularProgressIndicator(
                    color: LinkVaultColors.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (_, _) => Scaffold(
        backgroundColor: LinkVaultThemeTokens.background(context),
        body: Stack(
          children: [
            const Positioned.fill(
              child: IgnorePointer(child: VelocityKineticBackground()),
            ),
            Center(child: Text('DATABASE_ERROR', style: textTheme.labelLarge)),
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

  Future<void> _addExistingLink(BuildContext context, WidgetRef ref) async {
    final linkIds = await showDialog<List<int>>(
      context: context,
      builder: (context) {
        return CollectionLinkPickerDialog(collectionId: collectionId);
      },
    );

    if (linkIds == null || linkIds.isEmpty) {
      return;
    }

    final repository = ref.read(collectionsRepositoryProvider);
    for (final linkId in linkIds) {
      await repository.addLink(collectionId, linkId);
    }
  }

  Future<void> _removeLink(WidgetRef ref, int linkId) async {
    await ref
        .read(collectionsRepositoryProvider)
        .removeLink(collectionId, linkId);
  }

  Future<void> _archiveCollection(
    BuildContext context,
    WidgetRef ref,
    CollectionWithCount collection,
  ) async {
    final confirmed = await showArchiveCollectionDialog(
      context,
      collection.collection.title,
    );
    if (!confirmed || !context.mounted) {
      return;
    }

    await ref
        .read(collectionsRepositoryProvider)
        .delete(collection.collection.id);
    if (!context.mounted) {
      return;
    }

    context.go('/collections');
  }
}

class _EmptyCollectionDetailsState extends StatelessWidget {
  const _EmptyCollectionDetailsState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LinkVaultThemeTokens.background(context),
      body: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(child: VelocityKineticBackground()),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'COLLECTION_NOT_FOUND',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: LinkVaultColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Return to collections and choose another group.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 220,
                    child: VelocityButton(
                      label: 'BACK_TO_COLLECTIONS',
                      onPressed: () => context.go('/collections'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
