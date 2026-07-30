import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/feed/presentation/widgets/feed_empty_state.dart';
import 'package:linkvault/l10n/app_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_empty_state.dart';

void main() {
  testWidgets('feed empty state uses the shared illustration treatment', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: FeedEmptyState()),
      ),
    );
    await tester.pump();

    expect(find.byType(LibraryEmptyState), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('No links yet.'), findsOneWidget);
    expect(find.text('Start by adding some.'), findsOneWidget);
    expect(
      tester
          .widget<Text>(find.byKey(const Key('library-empty-title')))
          .style
          ?.fontWeight,
      FontWeight.w700,
    );
    expect(
      tester
          .widget<Text>(find.byKey(const Key('library-empty-subtitle')))
          .style
          ?.fontWeight,
      FontWeight.w400,
    );
    final picture = tester.widget<Image>(find.byType(Image));
    expect(
      (picture.image as AssetImage).assetName,
      LibraryEmptyState.lightIllustrationAsset,
    );
    expect(picture.width, 178);
    expect(picture.height, 110);
    expect(picture.fit, BoxFit.cover);
    expect(picture.alignment, const Alignment(0, -.2));
  });

  testWidgets('shared empty state uses dark artwork in dark mode', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        home: const Scaffold(body: LibraryEmptyState(title: 'Nothing here.')),
      ),
    );

    final picture = tester.widget<Image>(find.byType(Image));
    expect(
      (picture.image as AssetImage).assetName,
      LibraryEmptyState.darkIllustrationAsset,
    );
  });
}
