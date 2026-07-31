import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/collections/presentation/widget/collections_widgets.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';

void main() {
  testWidgets('selected collection card does not overflow at narrow width', (
    tester,
  ) async {
    final collection = Collection(
      id: 1,
      title: 'A VERY LONG COLLECTION TITLE',
      type: 'PRIVATE',
      iconKey: 'folder',
      tagName: 'A_VERY_LONG_COLLECTION_TAG',
      isFavourite: false,
      isPinned: false,
      isArchived: false,
      createdAt: DateTime(2024),
      updatedAt: DateTime(2024),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: LinkVaultTheme.light(const Color(0xFFFF6262)),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 120,
              height: 164,
              child: CollectionFeedCard(
                group: CollectionWithCount(collection: collection, count: 999),
                selectionMode: true,
                selected: true,
                onToggleSelection: () {},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('999 links'), findsOneWidget);
    expect(find.text('A very long collection title'), findsOneWidget);
    expect(find.text('A very long collection tag'), findsOneWidget);
    expect(find.text('A VERY LONG COLLECTION TITLE'), findsNothing);
    expect(find.byIcon(Icons.folder_rounded), findsOneWidget);
  });

  testWidgets('standard card uses the reference list proportions', (
    tester,
  ) async {
    final collection = Collection(
      id: 2,
      title: 'DEVELOPMENT',
      type: 'PRIVATE',
      iconKey: 'terminal',
      tagName: 'DEV',
      isFavourite: false,
      isPinned: false,
      isArchived: false,
      createdAt: DateTime(2024),
      updatedAt: DateTime(2024),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: LinkVaultTheme.light(const Color(0xFFFF6262)),
        home: Scaffold(
          body: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 390,
              child: CollectionFeedCard(
                group: CollectionWithCount(
                  collection: collection,
                  count: 3,
                  description: 'A useful development collection.',
                ),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Development'), findsOneWidget);
    expect(find.text('Dev'), findsOneWidget);
    expect(find.text('3 links'), findsOneWidget);
    expect(find.text('A useful development collection.'), findsNothing);
    final tagText = tester.widget<Text>(find.text('Dev'));
    final countText = tester.widget<Text>(find.text('3 links'));
    final titleText = tester.widget<Text>(find.text('Development'));
    expect(titleText.style?.fontSize, 15);
    expect(titleText.style?.height, 1.05);
    expect(tagText.style?.fontSize, 12);
    expect(countText.style?.fontSize, tagText.style?.fontSize);
    expect(
      tester
          .getSize(find.byKey(const Key('collection-feed-card-surface')))
          .height,
      104,
    );
    expect(
      tester.getSize(find.byKey(const Key('collection-preview-stack'))),
      const Size(103, 84),
    );
    final card = find.byKey(const Key('collection-feed-card-surface'));
    final icon = find.byKey(const Key('collection-card-icon'));
    final count = find.byKey(const Key('collection-card-link-count'));
    final tag = find.byKey(const Key('collection-card-tag'));
    expect(tester.getSize(icon), const Size.square(34));
    expect(tester.getTopRight(card).dx - tester.getTopRight(icon).dx, 10);
    expect(
      tester.getTopLeft(find.byKey(const Key('collection-card-content'))).dy,
      tester.getTopLeft(icon).dy,
    );
    expect(
      tester.getTopLeft(find.byKey(const Key('collection-card-content'))).dy,
      tester.getTopLeft(card).dy + 10,
    );
    expect(tester.getTopLeft(count).dy, lessThan(tester.getTopLeft(tag).dy));
    expect(tester.getBottomLeft(tag).dy, tester.getBottomLeft(card).dy - 10);
    final trailingIcon = find.descendant(
      of: icon,
      matching: find.byIcon(Icons.terminal_rounded),
    );
    expect(tester.widget<Icon>(trailingIcon).size, 19);
  });

  testWidgets('selection checkbox overlays without shifting the cover', (
    tester,
  ) async {
    final collection = Collection(
      id: 3,
      title: 'DEVELOPMENT',
      type: 'PRIVATE',
      iconKey: 'terminal',
      tagName: 'DEV',
      isFavourite: false,
      isPinned: false,
      isArchived: false,
      createdAt: DateTime(2024),
      updatedAt: DateTime(2024),
    );

    Future<void> pumpCard({required bool selectionMode}) {
      return tester.pumpWidget(
        MaterialApp(
          theme: LinkVaultTheme.light(const Color(0xFFFF6262)),
          home: Scaffold(
            body: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 390,
                child: CollectionFeedCard(
                  group: CollectionWithCount(collection: collection, count: 3),
                  selectionMode: selectionMode,
                  selected: selectionMode,
                ),
              ),
            ),
          ),
        ),
      );
    }

    await pumpCard(selectionMode: false);
    final normalCoverLeft = tester
        .getTopLeft(find.byKey(const Key('collection-preview-stack')))
        .dx;

    await pumpCard(selectionMode: true);
    final selectedCoverLeft = tester
        .getTopLeft(find.byKey(const Key('collection-preview-stack')))
        .dx;

    expect(selectedCoverLeft, normalCoverLeft);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
    expect(
      tester.getSize(find.byKey(const Key('collection-selection-checkbox'))),
      const Size(28, 28),
    );
  });
}
