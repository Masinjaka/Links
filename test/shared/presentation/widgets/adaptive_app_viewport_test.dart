import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/shared/presentation/widgets/adaptive_app_viewport.dart';

void main() {
  const devices = [
    (
      platform: TargetPlatform.iOS,
      size: Size(393, 852),
      paintedElementSize: 90.0,
    ),
    (
      platform: TargetPlatform.android,
      size: Size(412, 892),
      paintedElementSize: 94.0,
    ),
  ];

  for (final device in devices) {
    testWidgets('adapts the viewport on ${device.platform.name}', (
      tester,
    ) async {
      tester.view.physicalSize = device.size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(platform: device.platform),
          builder: (context, child) {
            return AdaptiveAppViewport(child: child!);
          },
          home: const _DensityProbe(),
        ),
      );

      expect(find.text('436.7'), findsOneWidget);
      expect(
        _paintedSize(tester, find.byKey(_DensityProbe.pageKey)),
        Size.square(device.paintedElementSize),
      );

      await tester.tap(find.text('dialog'));
      await tester.pumpAndSettle();
      expect(
        _paintedSize(tester, find.byKey(_DensityProbe.dialogKey)),
        Size.square(device.paintedElementSize),
      );
      Navigator.of(tester.element(find.byKey(_DensityProbe.dialogKey))).pop();
      await tester.pumpAndSettle();

      await tester.tap(find.text('sheet'));
      await tester.pumpAndSettle();
      expect(
        _paintedSize(tester, find.byKey(_DensityProbe.sheetKey)),
        Size.square(device.paintedElementSize),
      );
    });
  }

  testWidgets('does not magnify large viewports', (tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const MaterialApp(home: AdaptiveAppViewport(child: _DensityProbe())),
    );

    expect(
      _paintedSize(tester, find.byKey(_DensityProbe.pageKey)),
      const Size.square(100),
    );
  });

  testWidgets('compacts short wide viewports', (tester) async {
    tester.view.physicalSize = const Size(800, 600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const MaterialApp(home: AdaptiveAppViewport(child: _DensityProbe())),
    );

    expect(
      _paintedSize(tester, find.byKey(_DensityProbe.pageKey)),
      const Size.square(90),
    );
  });
}

Size _paintedSize(WidgetTester tester, Finder finder) {
  final box = tester.renderObject<RenderBox>(finder);
  final topLeft = box.localToGlobal(Offset.zero);
  final bottomRight = box.localToGlobal(box.size.bottomRight(Offset.zero));
  return Size(
    (bottomRight.dx - topLeft.dx).roundToDouble(),
    (bottomRight.dy - topLeft.dy).roundToDouble(),
  );
}

class _DensityProbe extends StatelessWidget {
  const _DensityProbe();

  static const pageKey = Key('density-page-element');
  static const dialogKey = Key('density-dialog-element');
  static const sheetKey = Key('density-sheet-element');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          Text(size.width.toStringAsFixed(1)),
          const SizedBox(key: pageKey, width: 100, height: 100),
          TextButton(
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => const Dialog(
                child: UnconstrainedBox(
                  child: SizedBox(key: dialogKey, width: 100, height: 100),
                ),
              ),
            ),
            child: const Text('dialog'),
          ),
          TextButton(
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              builder: (context) {
                return const UnconstrainedBox(
                  child: SizedBox(key: sheetKey, width: 100, height: 100),
                );
              },
            ),
            child: const Text('sheet'),
          ),
        ],
      ),
    );
  }
}
