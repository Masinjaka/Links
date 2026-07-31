import 'package:flutter/widgets.dart';

bool hasContentBehindNavigation(
  ScrollMetrics metrics, {
  required double clearExtent,
}) {
  return metrics.axis == Axis.vertical &&
      metrics.maxScrollExtent > 0 &&
      metrics.extentAfter > clearExtent + 1;
}
