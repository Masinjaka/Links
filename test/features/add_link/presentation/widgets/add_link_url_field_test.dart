import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/add_link/presentation/widget/add_link_url_field.dart';

void main() {
  testWidgets('url field uses lowercase hint and supports cursor placement', (
    tester,
  ) async {
    final controller = TextEditingController(text: 'https://example.com/path');
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AddLinkUrlField(controller: controller, onChanged: (_) {}),
        ),
      ),
    );

    final fieldFinder = find.byKey(const Key('add-link-url-text-field'));
    final field = tester.widget<TextField>(fieldFinder);
    final ink = Theme.of(tester.element(fieldFinder)).colorScheme.onSurface;
    expect(field.decoration?.hintText, 'https://your link...');
    expect(field.decoration?.border, InputBorder.none);
    expect(field.decoration?.prefixIcon, isNull);
    expect(field.cursorColor, ink);
    expect(field.decoration?.focusedBorder, InputBorder.none);
    expect(field.style?.fontSize, 13);
    expect(field.keyboardType, TextInputType.url);
    expect(tester.getSize(find.byType(AddLinkUrlField)).height, 52);

    final fieldBox = tester.getRect(fieldFinder);
    await tester.tapAt(Offset(fieldBox.left + 4, fieldBox.center.dy));
    await tester.pump();

    expect(controller.selection.baseOffset, lessThan(controller.text.length));
  });
}
