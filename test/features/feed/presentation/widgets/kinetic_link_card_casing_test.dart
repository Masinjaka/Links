import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_selection_checkbox.dart';
import 'package:linkvault/features/feed/presentation/widgets/kinetic_link_card.dart';
import 'package:linkvault/features/feed/presentation/widgets/link_card_display_formatters.dart';

import 'support/link_card_fixture.dart';

void main() {
  testWidgets('link card follows the reference content order and casing', (
    tester,
  ) async {
    final createdAt = DateTime(2024, 3, 12);
    final link = linkCardFixture(createdAt);
    final linkWithImage = linkCardFixture(
      createdAt,
      imageUrl: 'https://example.com/preview.jpg',
    );
    expect(
      linkPreviewImageUrl(linkWithImage),
      'https://example.com/preview.jpg',
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: LinkVaultTheme.light(const Color(0xFFFF6262)),
        home: Scaffold(
          body: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 320,
              child: KineticLinkCard(
                link: link,
                onPin: () {},
                onFavourite: () {},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Uppercase link title'), findsOneWidget);
    expect(
      find.text('https://www.example.com/reference/path?source=test'),
      findsOneWidget,
    );
    expect(find.text('ui design'), findsOneWidget);
    expect(find.text('research'), findsNothing);
    expect(find.text('UPPERCASE LINK TITLE'), findsNothing);
    expect(
      tester.widget<Text>(find.text('Uppercase link title')).style?.fontSize,
      15,
    );
    expect(
      tester
          .widget<Text>(
            find.text('https://www.example.com/reference/path?source=test'),
          )
          .style
          ?.fontSize,
      15,
    );
    expect(tester.widget<Text>(find.text('ui design')).style?.fontSize, 12);
    expect(
      tester.getSize(find.byKey(const Key('link-preview-thumbnail'))),
      const Size(100, 100),
    );
    expect(
      tester.getSize(find.byKey(const Key('link-card-action-pin link'))),
      const Size(34, 34),
    );
    expect(
      tester.getSize(find.byKey(const Key('link-card-action-favourite link'))),
      const Size(34, 34),
    );
    expect(
      tester
          .getTopLeft(
            find.text('https://www.example.com/reference/path?source=test'),
          )
          .dy,
      lessThan(tester.getTopLeft(find.text('Uppercase link title')).dy),
    );
  });

  testWidgets('compact link card stays below old height at narrow width', (
    tester,
  ) async {
    final cardKey = GlobalKey();
    await tester.pumpWidget(
      MaterialApp(
        theme: LinkVaultTheme.light(const Color(0xFFFF6262)),
        home: Scaffold(
          body: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 300,
                child: KineticLinkCard(
                  key: cardKey,
                  link: linkCardFixture(DateTime(2024, 3, 12)),
                  leading: const SizedBox(width: 20, height: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.byKey(cardKey)).height, lessThan(200));
  });

  testWidgets('selection checkbox overlays without shifting the preview', (
    tester,
  ) async {
    final link = linkCardFixture(DateTime(2024, 3, 12));

    Future<void> pumpCard({required bool selectionMode}) {
      return tester.pumpWidget(
        MaterialApp(
          theme: LinkVaultTheme.light(const Color(0xFFFF6262)),
          home: Scaffold(
            body: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 320,
                child: KineticLinkCard(
                  link: link,
                  onPin: () {},
                  onFavourite: () {},
                  leading: selectionMode
                      ? const FeedSelectionCheckbox(selected: true)
                      : null,
                ),
              ),
            ),
          ),
        ),
      );
    }

    await pumpCard(selectionMode: false);
    final normalPreviewLeft = tester
        .getTopLeft(find.byKey(const Key('link-preview-thumbnail')))
        .dx;

    await pumpCard(selectionMode: true);
    final selectedPreviewLeft = tester
        .getTopLeft(find.byKey(const Key('link-preview-thumbnail')))
        .dx;

    expect(selectedPreviewLeft, normalPreviewLeft);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    expect(
      tester.getSize(find.byKey(const Key('feed-selection-checkbox'))),
      const Size(28, 28),
    );
    expect(find.byKey(const Key('link-card-action-pin link')), findsOneWidget);
    expect(
      find.byKey(const Key('link-card-action-favourite link')),
      findsOneWidget,
    );
  });
}
