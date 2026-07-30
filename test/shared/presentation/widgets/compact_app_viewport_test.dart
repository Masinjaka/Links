import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/shared/presentation/widgets/compact_app_viewport.dart';

void main() {
  for (final platform in [TargetPlatform.iOS, TargetPlatform.android]) {
    testWidgets('uses the same compact density on ${platform.name}', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(platform: platform),
          builder: (context, child) {
            return CompactAppViewport(child: child!);
          },
          home: const _DensityProbe(),
        ),
      );

      expect(find.text('444.4 × 888.9'), findsOneWidget);
      expect(_paintedSize(tester, find.byKey(_DensityProbe.pageKey)), _compact);

      await tester.tap(find.text('dialog'));
      await tester.pumpAndSettle();
      expect(
        _paintedSize(tester, find.byKey(_DensityProbe.dialogKey)),
        _compact,
      );
      Navigator.of(tester.element(find.byKey(_DensityProbe.dialogKey))).pop();
      await tester.pumpAndSettle();

      await tester.tap(find.text('sheet'));
      await tester.pumpAndSettle();
      expect(
        _paintedSize(tester, find.byKey(_DensityProbe.sheetKey)),
        _compact,
      );
    });
  }
}

const _compact = Size(90, 90);

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
          Text(
            '${size.width.toStringAsFixed(1)} × '
            '${size.height.toStringAsFixed(1)}',
          ),
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
