import 'dart:math' as math;

import 'package:flutter/material.dart';

double insetSheetHeight(BuildContext context, {double topGap = 8}) {
  final mediaQuery = MediaQuery.of(context);
  final view = View.of(context);
  final viewWidth = view.physicalSize.width / view.devicePixelRatio;
  final viewportScale = mediaQuery.size.width <= 0
      ? 1.0
      : math.max(.1, viewWidth / mediaQuery.size.width);
  final systemTop = view.padding.top / view.devicePixelRatio / viewportScale;
  final topInset = math.max(mediaQuery.viewPadding.top, systemTop);
  return math.max(0, mediaQuery.size.height - topInset - topGap);
}
