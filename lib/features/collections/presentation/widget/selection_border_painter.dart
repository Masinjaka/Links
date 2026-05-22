part of 'collection_details_widgets.dart';

class _SelectionBorderPainter extends CustomPainter {
  const _SelectionBorderPainter({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) {
      return;
    }

    const strokeWidth = 2.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final inset = strokeWidth / 2;
    var radius = LinkVaultThemeTokens.componentRadiusValue - inset;
    final maxHorizontalRadius = (size.width / 2) - inset;
    final maxVerticalRadius = (size.height / 2) - inset;
    if (radius < 0) {
      radius = 0;
    }
    if (radius > maxHorizontalRadius) {
      radius = maxHorizontalRadius;
    }
    if (radius > maxVerticalRadius) {
      radius = maxVerticalRadius;
    }

    final topCenter = Offset(size.width / 2, inset);
    final topLeft = Offset(inset, inset);
    final topRight = Offset(size.width - inset, inset);
    final leftCenter = Offset(inset, size.height / 2);
    final rightCenter = Offset(size.width - inset, size.height / 2);
    final bottomCenter = Offset(size.width / 2, size.height - inset);
    final bottomLeft = Offset(inset, size.height - inset);
    final bottomRight = Offset(size.width - inset, size.height - inset);

    _drawPathSegment(
      canvas,
      paint,
      _buildTopLeftPath(
        topCenter: topCenter,
        topLeft: topLeft,
        leftCenter: leftCenter,
        radius: radius,
      ),
      progress,
    );
    _drawPathSegment(
      canvas,
      paint,
      _buildTopRightPath(
        topCenter: topCenter,
        topRight: topRight,
        rightCenter: rightCenter,
        radius: radius,
      ),
      progress,
    );
    _drawPathSegment(
      canvas,
      paint,
      _buildBottomLeftPath(
        bottomCenter: bottomCenter,
        bottomLeft: bottomLeft,
        leftCenter: leftCenter,
        radius: radius,
      ),
      progress,
    );
    _drawPathSegment(
      canvas,
      paint,
      _buildBottomRightPath(
        bottomCenter: bottomCenter,
        bottomRight: bottomRight,
        rightCenter: rightCenter,
        radius: radius,
      ),
      progress,
    );
  }

  Path _buildTopLeftPath({
    required Offset topCenter,
    required Offset topLeft,
    required Offset leftCenter,
    required double radius,
  }) {
    return Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(topLeft.dx + radius, topLeft.dy)
      ..quadraticBezierTo(
        topLeft.dx,
        topLeft.dy,
        topLeft.dx,
        topLeft.dy + radius,
      )
      ..lineTo(leftCenter.dx, leftCenter.dy);
  }

  Path _buildTopRightPath({
    required Offset topCenter,
    required Offset topRight,
    required Offset rightCenter,
    required double radius,
  }) {
    return Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(topRight.dx - radius, topRight.dy)
      ..quadraticBezierTo(
        topRight.dx,
        topRight.dy,
        topRight.dx,
        topRight.dy + radius,
      )
      ..lineTo(rightCenter.dx, rightCenter.dy);
  }

  Path _buildBottomLeftPath({
    required Offset bottomCenter,
    required Offset bottomLeft,
    required Offset leftCenter,
    required double radius,
  }) {
    return Path()
      ..moveTo(bottomCenter.dx, bottomCenter.dy)
      ..lineTo(bottomLeft.dx + radius, bottomLeft.dy)
      ..quadraticBezierTo(
        bottomLeft.dx,
        bottomLeft.dy,
        bottomLeft.dx,
        bottomLeft.dy - radius,
      )
      ..lineTo(leftCenter.dx, leftCenter.dy);
  }

  Path _buildBottomRightPath({
    required Offset bottomCenter,
    required Offset bottomRight,
    required Offset rightCenter,
    required double radius,
  }) {
    return Path()
      ..moveTo(bottomCenter.dx, bottomCenter.dy)
      ..lineTo(bottomRight.dx - radius, bottomRight.dy)
      ..quadraticBezierTo(
        bottomRight.dx,
        bottomRight.dy,
        bottomRight.dx,
        bottomRight.dy - radius,
      )
      ..lineTo(rightCenter.dx, rightCenter.dy);
  }

  void _drawPathSegment(
    Canvas canvas,
    Paint paint,
    Path path,
    double progress,
  ) {
    for (final metric in path.computeMetrics()) {
      final segment = metric.extractPath(0, metric.length * progress);
      canvas.drawPath(segment, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SelectionBorderPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
