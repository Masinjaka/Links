import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/add_link/presentation/widget/add_link_body.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_save_button.dart';

void main() {
  testWidgets('new-link form uses simple title and sentence-case action', (
    tester,
  ) async {
    final urlController = TextEditingController();
    final tagController = TextEditingController();
    final noteController = TextEditingController();
    addTearDown(urlController.dispose);
    addTearDown(tagController.dispose);
    addTearDown(noteController.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: AddLinkBody(
          isEditing: false,
          isSaving: false,
          urlController: urlController,
          tagController: tagController,
          noteController: noteController,
          urlDraft: '',
          preview: const AsyncLoading(),
          availableTags: const [],
          selectedTags: const {},
          collections: const [],
          selectedCollectionId: null,
          onBack: () {},
          onUrlChanged: (_) {},
          onAddTag: (_) {},
          onToggleTag: (_) {},
          onCollectionSelected: (_) {},
          onSave: () {},
        ),
      ),
    );

    expect(find.text('NEW LINK'), findsOneWidget);
    expect(find.text('Add link'), findsOneWidget);
    expect(find.text('Collection'), findsOneWidget);
    expect(find.text('Note'), findsOneWidget);
    final note = tester.widget<TextField>(
      find.byKey(const Key('add-link-note-field')),
    );
    final ink = Theme.of(
      tester.element(find.byKey(const Key('add-link-note-field'))),
    ).colorScheme.onSurface;
    expect(note.style?.color, ink);
    expect(note.decoration?.hintText, 'Add note');
    expect(tester.getSize(find.byType(AddLinkSaveButton)).width, 736);
    expect(find.text('PASTE URL'), findsNothing);
    expect(find.text('SAVE LINK'), findsNothing);
  });
}
