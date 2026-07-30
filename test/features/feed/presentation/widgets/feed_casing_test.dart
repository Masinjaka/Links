import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/feed/presentation/widgets/feed_filter_rail.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_header_widget.dart';
import 'package:linkvault/features/feed/presentation/widgets/feed_search_strip.dart';

void main() {
  testWidgets('feed controls follow the reference casing', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              const FeedHeader(),
              FeedSearchStrip(onChanged: (_) {}),
              FeedFilterRail(
                filters: const ['ALL_ASSETS', 'UI_DESIGN'],
                selectedFilter: 'ALL_ASSETS',
                onSelected: (_) {},
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('ROHY'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Ui design'), findsOneWidget);
    expect(find.text('ALL ASSETS'), findsNothing);
  });
}
