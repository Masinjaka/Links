import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/shared/presentation/widgets/pinned_search_filter_app_bar.dart';

void main() {
  testWidgets('search and filters remain pinned while content scrolls', (
    tester,
  ) async {
    const titleKey = Key('page-title');
    const searchKey = Key('search-control');
    const filtersKey = Key('filter-controls');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.only(top: 32),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(key: titleKey, height: 24),
                ),
              ),
              PinnedSearchFilterAppBar(
                search: Container(
                  key: searchKey,
                  height: 44,
                  color: Colors.white,
                ),
                filters: Container(
                  key: filtersKey,
                  height: 30,
                  color: Colors.grey,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 1600)),
            ],
          ),
        ),
      ),
    );

    final titleBottom = tester.getBottomLeft(find.byKey(titleKey)).dy;
    final searchTop = tester.getTopLeft(find.byKey(searchKey)).dy;
    expect(searchTop - titleBottom, 28);

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -600));
    await tester.pumpAndSettle();
    final pinnedSearchTop = tester.getTopLeft(find.byKey(searchKey)).dy;
    final pinnedFiltersTop = tester.getTopLeft(find.byKey(filtersKey)).dy;

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(
      tester.getTopLeft(find.byKey(searchKey)).dy,
      closeTo(pinnedSearchTop, 0.1),
    );
    expect(
      tester.getTopLeft(find.byKey(filtersKey)).dy,
      closeTo(pinnedFiltersTop, 0.1),
    );
  });
}
