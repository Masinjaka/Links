import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/feed/presentation/widgets/feed_selection_overlay.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';

import '../../../../support/recording_feed_repository.dart';

void main() {
  testWidgets('filled actions bulk unfavourite and unpin selected IDs', (
    tester,
  ) async {
    final repository = RecordingFeedRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [feedRepositoryProvider.overrideWith((ref) => repository)],
        child: MaterialApp(
          home: Consumer(
            builder: (context, ref, _) {
              ref.watch(feedSelectionModeProvider);
              ref.watch(selectedFeedLinkIdsProvider);
              return const Scaffold(
                body: Stack(
                  children: [
                    FeedSelectionOverlay(
                      selectedFilter: allAssetsFilter,
                      allFavourite: true,
                      allPinned: true,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );

    final container = ProviderScope.containerOf(
      tester.element(find.byType(FeedSelectionOverlay)),
    );
    container.read(feedSelectionModeProvider.notifier).enable();
    container.read(selectedFeedLinkIdsProvider.notifier).addAll([7, 8]);
    await tester.tap(find.byKey(const Key('selection-action-0')));
    await tester.pump();

    expect(repository.favouriteIds, {7, 8});
    expect(repository.favouriteValue, isFalse);
    expect(container.read(feedSelectionModeProvider), isTrue);
    expect(container.read(selectedFeedLinkIdsProvider), {7, 8});

    await tester.tap(find.byKey(const Key('selection-action-1')));
    await tester.pump();

    expect(repository.pinnedIds, {7, 8});
    expect(repository.pinnedValue, isFalse);
    expect(container.read(feedSelectionModeProvider), isTrue);
    expect(container.read(selectedFeedLinkIdsProvider), {7, 8});
  });
}
