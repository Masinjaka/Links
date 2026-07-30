import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math' as math;

import 'package:linkvault/features/collections/presentation/widget/collection_preview_stack.dart';

void main() {
  for (final (name, urls) in const [
    ('no links', <String?>[]),
    ('one link', <String?>['https://example.com/one.jpg']),
    (
      'two links',
      <String?>['https://example.com/one.jpg', 'https://example.com/two.jpg'],
    ),
    (
      'three links',
      <String?>[
        'https://example.com/one.jpg',
        'https://example.com/two.jpg',
        'https://example.com/three.jpg',
      ],
    ),
  ]) {
    testWidgets('$name keeps a complete three-tile preview stack', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CollectionPreviewStack(iconKey: 'terminal', imageUrls: urls),
          ),
        ),
      );

      expect(find.byKey(const Key('collection-preview-stack')), findsOneWidget);
      for (var slot = 0; slot < 3; slot++) {
        expect(
          find.byKey(Key('collection-preview-slot-$slot')),
          findsOneWidget,
        );
        expect(
          tester.getSize(find.byKey(Key('collection-preview-slot-$slot'))),
          const Size.square(68),
        );
      }
      final rotations = [
        tester.widget<Transform>(
          find.byKey(const Key('collection-preview-rotation-0')),
        ),
        tester.widget<Transform>(
          find.byKey(const Key('collection-preview-rotation-1')),
        ),
        tester.widget<Transform>(
          find.byKey(const Key('collection-preview-rotation-2')),
        ),
      ];
      const tenDegrees = 10 * math.pi / 180;
      expect(rotations[0].transform, Matrix4.rotationZ(tenDegrees));
      expect(rotations[1].transform, Matrix4.identity());
      expect(rotations[2].transform, Matrix4.rotationZ(-tenDegrees));
      expect(find.byType(CachedNetworkImage), findsNWidgets(urls.length));
      expect(
        tester.getSize(find.byKey(const Key('collection-preview-stack'))),
        CollectionPreviewStack.size,
      );
      final positions = [
        _positioned(tester, 0),
        _positioned(tester, 1),
        _positioned(tester, 2),
      ];
      expect((positions[0].left, positions[0].top), (29.5, 8));
      expect((positions[1].left, positions[1].top), (17.5, 0));
      expect((positions[2].left, positions[2].top), (5.5, 8));
    });
  }
}

Positioned _positioned(WidgetTester tester, int slot) {
  return tester.widget<Positioned>(
    find.ancestor(
      of: find.byKey(Key('collection-preview-rotation-$slot')),
      matching: find.byType(Positioned),
    ),
  );
}
