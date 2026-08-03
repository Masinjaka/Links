import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/feed/presentation/widgets/feed_selection_overlay.dart';
import 'package:linkvault/features/feed/provider/feed_providers.dart';

import '../../../../support/recording_feed_repository.dart';

void main() {
  testWidgets('selected links require confirmation and can be restored', (
    tester,
  ) async {
    final repository = RecordingFeedRepository();
    final container = await _pumpOverlay(tester, repository);
    container.read(selectedFeedLinkIdsProvider.notifier).addAll([7, 8]);

    expect(find.byTooltip('Move to trash'), findsNothing);
    await tester.tap(find.byTooltip('Delete permanently'));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('library-action-dialog')), findsOneWidget);
    expect(repository.trashedIds, isEmpty);

    await tester.tap(find.byKey(const Key('confirm-delete-links')));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(milliseconds: 300));

    expect(repository.trashedIds, {7, 8});
    expect(repository.deletedIds, isEmpty);
    expect(find.text('Undo'), findsOneWidget);
    final messageBounds = tester.getRect(find.text('2 links deleted'));
    final undoBounds = tester.getRect(
      find.byKey(const Key('delete-links-undo')),
    );
    expect(undoBounds.left - messageBounds.right, inInclusiveRange(0, 8));

    await tester.tap(find.byKey(const Key('delete-links-undo')));
    await tester.pumpAndSettle();

    expect(repository.restoredIds, {7, 8});
    expect(repository.deletedIds, isEmpty);
  });

  testWidgets('confirmed links are permanently deleted after Undo expires', (
    tester,
  ) async {
    final repository = RecordingFeedRepository();
    final container = await _pumpOverlay(tester, repository);
    container.read(selectedFeedLinkIdsProvider.notifier).addAll([7, 8]);

    await tester.tap(find.byTooltip('Delete permanently'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirm-delete-links')));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(milliseconds: 300));
    tester
        .state<ScaffoldMessengerState>(find.byType(ScaffoldMessenger))
        .hideCurrentSnackBar(reason: SnackBarClosedReason.timeout);
    await tester.pumpAndSettle();
    await tester.pump();

    expect(repository.deletedIds, {7, 8});
    expect(repository.restoredIds, isEmpty);
  });
}

Future<ProviderContainer> _pumpOverlay(
  WidgetTester tester,
  RecordingFeedRepository repository,
) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [feedRepositoryProvider.overrideWith((ref) => repository)],
      child: const MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              FeedSelectionOverlay(
                selectedFilter: allAssetsFilter,
                allFavourite: false,
                allPinned: false,
              ),
            ],
          ),
        ),
      ),
    ),
  );
  return ProviderScope.containerOf(
    tester.element(find.byType(FeedSelectionOverlay)),
  );
}
