import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/app_router.dart';
import 'package:linkvault/features/add_link/presentation/add_link_page.dart';
import 'package:linkvault/features/feed/presentation/feed_page.dart';
import 'package:linkvault/features/splash/presentation/splash_animation_timing.dart';
import 'package:linkvault/features/splash/presentation/splash_page.dart';

import '../support/linkvault_test_harness.dart';
import '../support/test_shared_url_service.dart';

void main() {
  testWidgets('cold-start share skips splash and keeps capture sheet open', (
    tester,
  ) async {
    const sharedUrl = 'https://example.com/shared';
    final service = TestSharedUrlService.pending();
    addTearDown(service.dispose);

    await tester.pumpLinkVault('/splash', sharedUrlService: service);

    expect(find.byType(SplashPage), findsNothing);
    expect(find.byKey(const Key('app-startup-background')), findsOneWidget);
    expect(find.byType(FeedPage), findsNothing);

    service.complete(sharedUrl);
    await tester.pumpAppFrame();

    expect(find.byType(SplashPage), findsNothing);
    expect(find.byType(FeedPage), findsOneWidget);
    expect(find.byKey(const Key('add-link-sheet-surface')), findsOneWidget);
    final addPage = tester.widget<AddLinkPage>(find.byType(AddLinkPage));
    expect(addPage.sheetMode, isTrue);
    expect(addPage.initialUrl, sharedUrl);
    expect(appRouter.routerDelegate.currentConfiguration.uri.path, '/');

    await tester.pump(SplashAnimationTiming.totalDuration);
    await tester.pump();

    expect(find.byKey(const Key('add-link-sheet-surface')), findsOneWidget);
    expect(find.text(sharedUrl), findsOneWidget);
  });

  testWidgets('normal startup begins splash after share intake resolves', (
    tester,
  ) async {
    final service = TestSharedUrlService.pending();
    addTearDown(service.dispose);

    await tester.pumpLinkVault('/splash', sharedUrlService: service);
    expect(find.byType(SplashPage), findsNothing);

    service.complete(null);
    await tester.pump();
    await tester.pump();

    expect(find.byKey(const Key('app-startup-background')), findsNothing);
    expect(find.byType(SplashPage), findsOneWidget);

    await tester.pump(SplashAnimationTiming.totalDuration);
    await tester.pumpWidget(const SizedBox.shrink());
  });
}
