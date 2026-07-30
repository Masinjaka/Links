import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/collections/presentation/widget/collection_details_widgets.dart';

void main() {
  testWidgets('single-collection archive uses the shared dialog', (
    tester,
  ) async {
    bool? confirmed;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              confirmed = await showArchiveCollectionDialog(
                context,
                'Development',
              );
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

    await tester.tap(find.byKey(const Key('confirm-archive-collection')));
    await tester.pumpAndSettle();
    expect(confirmed, isTrue);
  });

  testWidgets('bulk collection archive uses the shared dialog', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => showArchiveCollectionsDialog(context, 2),
            child: const Text('Open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.byType(Dialog), findsOneWidget);
    expect(find.byType(BottomSheet), findsNothing);
    expect(
      find.byKey(const Key('confirm-archive-collections')),
      findsOneWidget,
    );
  });
}
