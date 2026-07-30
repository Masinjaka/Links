import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/feed/presentation/widgets/archive_links_dialog.dart';

void main() {
  testWidgets('archive confirmation uses the shared dialog', (tester) async {
    bool? confirmed;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              confirmed = await showArchiveLinksDialog(context, 2);
            },
            child: const Text('Open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.byKey(const Key('library-action-dialog')), findsOneWidget);
    expect(find.byType(BottomSheet), findsNothing);
    expect(find.text('Archive'), findsNWidgets(2));
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Archive'), findsNWidgets(2));

    await tester.tap(find.byKey(const Key('confirm-archive-links')));
    await tester.pumpAndSettle();
    expect(confirmed, isTrue);
  });
}
