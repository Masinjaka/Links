import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/shared/presentation/widgets/library_pill_text_field.dart';

void main() {
  testWidgets('uses exact pill geometry and forwards text input', (
    tester,
  ) async {
    final controller = TextEditingController();
    final pillKey = GlobalKey();
    var value = '';
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: LibraryPillTextField(
              key: pillKey,
              controller: controller,
              hintText: 'Search or add tag',
              fontSize: 12,
              onChanged: (text) => value = text,
              trailing: const SizedBox.square(
                key: Key('pill-action'),
                dimension: 20,
              ),
            ),
          ),
        ),
      ),
    );

    expect(tester.getSize(find.byKey(pillKey)).height, 42);
    expect(
      tester.getSize(find.byKey(const Key('pill-action'))),
      const Size(20, 20),
    );
    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.decoration?.hintText, 'Search or add tag');
    expect(field.decoration?.border, InputBorder.none);
    expect(field.style?.fontSize, 12);
    expect(field.expands, isTrue);
    expect(field.textAlignVertical, TextAlignVertical.center);

    await tester.enterText(find.byType(TextField), 'Culture');
    expect(value, 'Culture');
  });
}
