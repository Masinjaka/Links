import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_tag_section.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_tag_choice_chip.dart';

void main() {
  testWidgets('tags start unselected and follow the sheet label style', (
    tester,
  ) async {
    final controller = TextEditingController();
    String? toggled;
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AddLinkTagSection(
            availableTags: const ['DESIGN', 'UI_DESIGN'],
            selectedTags: const {},
            controller: controller,
            onAdd: (_) {},
            onToggle: (value) => toggled = value,
          ),
        ),
      ),
    );

    expect(find.text('Tags'), findsOneWidget);
    expect(find.text('Add new tag'), findsNothing);
    expect(find.text('NEW TAG'), findsNothing);
    expect(find.text('Design'), findsNothing);
    expect(find.text('Ui design'), findsNothing);

    await tester.tap(find.byKey(const Key('add-link-new-tag-button')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('add-link-tags-sheet')), findsOneWidget);
    expect(find.text('Add tags'), findsOneWidget);
    expect(find.text('Search or add tag'), findsOneWidget);
    expect(find.text('Design'), findsOneWidget);
    expect(find.text('Ui design'), findsOneWidget);

    await tester.tap(find.text('Design'));
    await tester.pump();
    expect(toggled, 'DESIGN');
  });

  testWidgets('a filtered tag remains selectable while the field is focused', (
    tester,
  ) async {
    final controller = TextEditingController();
    String? toggled;
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AddLinkTagSection(
            availableTags: const ['CULTURE', 'ART'],
            selectedTags: const {},
            controller: controller,
            onAdd: (_) {},
            onToggle: (value) => toggled = value,
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('add-link-new-tag-button')));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('add-link-tag-text-field')),
      'cult',
    );
    await tester.pump();

    expect(find.text('Culture'), findsOneWidget);
    expect(find.text('Art'), findsNothing);
    await tester.tap(find.text('Culture'));
    await tester.pump();

    expect(toggled, 'CULTURE');
    final chip = tester.widget<AddLinkTagChoiceChip>(
      find.byType(AddLinkTagChoiceChip),
    );
    expect(chip.selected, isTrue);
  });

  testWidgets('selected tag text is black in dark mode', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LinkVaultTheme.dark(LinkVaultColors.primary),
        home: AddLinkTagChoiceChip(tag: 'DESIGN', selected: true, onTap: () {}),
      ),
    );

    final label = tester.widget<Text>(find.text('Design'));
    expect(label.style?.color, Colors.black);
  });
}
