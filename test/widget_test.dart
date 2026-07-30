import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:linkvault/app/app_router.dart';
import 'package:linkvault/features/add_link/presentation/add_link_page.dart';
import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/collections/presentation/collections_page.dart';
import 'package:linkvault/features/link_details/presentation/link_details_page.dart';
import 'package:linkvault/features/onboarding/presentation/onboarding_page.dart';
import 'package:linkvault/features/profile/presentation/profile_page.dart';
import 'package:linkvault/features/settings/presentation/settings_page.dart';

import 'support/linkvault_test_harness.dart';

void main() {
  testWidgets('renders the feed page', (tester) async {
    await tester.pumpLinkVault('/');
    expect(find.text('ROHY'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('All'), findsOneWidget);
  });

  for (final route in const {
    '/onboarding': OnboardingPage,
    '/add': AddLinkPage,
    '/add?id=1': AddLinkPage,
    '/collections': CollectionsPage,
    '/details?id=1': LinkDetailsPage,
    '/profile': ProfilePage,
    '/settings': SettingsPage,
  }.entries) {
    testWidgets('renders ${route.key}', (tester) async {
      await tester.pumpLinkVault(route.key);
      expect(find.byType(route.value), findsOneWidget);
    });
  }

  testWidgets('details back button falls back to feed', (tester) async {
    await tester.pumpLinkVault('/details?id=1');
    await tester.tap(find.byKey(const Key('link-details-close')));
    await tester.pumpAppFrame();
    expect(find.text('ROHY'), findsOneWidget);
  });

  testWidgets('add link back button falls back to feed', (tester) async {
    await tester.pumpLinkVault('/add');
    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAppFrame();
    expect(find.text('ROHY'), findsOneWidget);
  });

  testWidgets('metadata card stays hidden until url input', (tester) async {
    await tester.pumpLinkVault('/add');
    expect(find.text('FETCHING_METADATA...'), findsNothing);
    await tester.enterText(
      find.byType(TextField).first,
      'https://manifesto.io/kinetic',
    );
    await tester.pump();
    expect(find.text('FETCHING_METADATA...'), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 400));
  });

  testWidgets('metadata card renders fetched metadata', (tester) async {
    await tester.pumpLinkVault('/add');
    await tester.enterText(
      find.byType(TextField).first,
      'https://manifesto.io/kinetic',
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();
    expect(find.text('Manifesto Preview'), findsOneWidget);
    expect(find.text('Kinetic futurism reference.'), findsOneWidget);
  });

  testWidgets('edit page preloads existing link data', (tester) async {
    await tester.pumpLinkVault('/add?id=1');
    await tester.pump();
    await tester.pump();
    expect(find.text('EDIT LINK'), findsOneWidget);
    expect(find.text('https://manifesto.io/kinetic'), findsOneWidget);
  });

  testWidgets('details hides absent reading time', (tester) async {
    await tester.pumpLinkVault('/details?id=1');
    expect(find.text('READ_5_MIN'), findsNothing);
  });

  testWidgets('add page shows persisted tags', (tester) async {
    await tester.pumpLinkVault('/add');
    expect(find.text('Persisted db'), findsNothing);
    await tester.tap(find.byKey(const Key('add-link-new-tag-button')));
    await tester.pumpAndSettle();
    expect(find.text('Persisted db'), findsOneWidget);
  });

  testWidgets('plus button adds a new tag chip', (tester) async {
    await tester.pumpLinkVault('/add');
    await tester.tap(find.byKey(const Key('add-link-new-tag-button')));
    await tester.pump();
    await tester.enterText(
      find.byKey(const Key('add-link-tag-text-field')),
      'Motion Study',
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(find.text('Motion study'), findsNWidgets(2));
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('add-link-tags-done')));
    await tester.pumpAndSettle();
    expect(find.text('Motion study'), findsOneWidget);
  });

  testWidgets('new edit tags appear in feed filters', (tester) async {
    await tester.pumpLinkVault('/add?id=1');
    final editTitle = find.text('EDIT LINK');
    expect(editTitle, findsOneWidget);
    final container = ProviderScope.containerOf(tester.element(editTitle));
    container.read(addLinkOptimisticTagsProvider.notifier).add('FRESH_FILTER');
    appRouter.go('/');
    await tester.pumpAppFrame();
    expect(find.text('Fresh filter'), findsOneWidget);
  });
}
