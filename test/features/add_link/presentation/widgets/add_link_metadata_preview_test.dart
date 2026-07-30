import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';

import 'package:linkvault/features/add_link/presentation/widget/add_link_widgets.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';

void main() {
  testWidgets('metadata card has a flat link-card surface', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AddLinkMetadataPreview(
            preview: AsyncLoading(),
            rawUrl: 'https://example.com',
          ),
        ),
      ),
    );

    _expectFlatCard(tester);
    final lightGradient =
        tester
                .widget<Shimmer>(
                  find.byKey(const Key('add-link-metadata-shimmer')),
                )
                .gradient
            as LinearGradient;

    await tester.pumpWidget(
      MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        themeAnimationDuration: Duration.zero,
        home: const Scaffold(
          body: AddLinkMetadataPreview(
            preview: AsyncLoading(),
            rawUrl: 'https://example.com',
          ),
        ),
      ),
    );

    final darkGradient =
        tester
                .widget<Shimmer>(
                  find.byKey(const Key('add-link-metadata-shimmer')),
                )
                .gradient
            as LinearGradient;
    expect(darkGradient.colors.first, isNot(lightGradient.colors.first));

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AddLinkMetadataPreview(
            preview: AsyncData(
              AddLinkMetadata(
                url: 'https://example.com',
                host: 'example.com',
                title: 'Example',
                description: 'Example description',
                imageUrl: 'https://example.com/preview.jpg',
                siteIconUrl: 'https://example.com/favicon.ico',
              ),
            ),
            rawUrl: 'https://example.com',
          ),
        ),
      ),
    );

    _expectFlatCard(tester);
    _expectBorderlessImage(tester);
    final image = tester.widget<Image>(
      find.byKey(const Key('add-link-metadata-preview-image')),
    );
    final provider = image.image as NetworkImage;
    expect(provider.url, 'https://example.com/preview.jpg');
  });
}

void _expectFlatCard(WidgetTester tester) {
  final card = tester.widget<Container>(
    find.byKey(const Key('add-link-metadata-card')),
  );
  final decoration = card.decoration! as BoxDecoration;
  expect(decoration.border, isNull);
  expect(decoration.boxShadow, isNull);
}

void _expectBorderlessImage(WidgetTester tester) {
  final image = tester.widget<Container>(
    find.byKey(const Key('add-link-metadata-image')),
  );
  final decoration = image.decoration! as BoxDecoration;
  expect(decoration.border, isNull);
}
