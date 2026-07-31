import 'dart:ui' show DisplayFeature;

import 'package:flutter/material.dart';

/// Keeps the app's visual proportions consistent across phone widths.
class AdaptiveAppViewport extends StatelessWidget {
  const AdaptiveAppViewport({super.key, required this.child});

  static const double referenceWidth = 393;
  static const double compactWidthBreakpoint = 600;
  static const double compactHeightBreakpoint = 600;
  static const double baselineScale = .9;
  static const double maximumScale = 1.1;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (!_hasFiniteViewport(constraints)) return child;
        final width = constraints.maxWidth;
        final scale = width >= compactWidthBreakpoint
            ? constraints.maxHeight <= compactHeightBreakpoint
                  ? baselineScale
                  : 1.0
            : (baselineScale * width / referenceWidth).clamp(
                baselineScale,
                maximumScale,
              );
        if (scale == 1) return child;

        final viewport = Size(
          constraints.maxWidth / scale,
          constraints.maxHeight / scale,
        );
        final scaledMediaQuery = mediaQuery.copyWith(
          size: viewport,
          padding: _resizeInsets(mediaQuery.padding, scale),
          viewPadding: _resizeInsets(mediaQuery.viewPadding, scale),
          viewInsets: _resizeInsets(mediaQuery.viewInsets, scale),
          systemGestureInsets: _resizeInsets(
            mediaQuery.systemGestureInsets,
            scale,
          ),
          displayFeatures: mediaQuery.displayFeatures
              .map((feature) => _resizeDisplayFeature(feature, scale))
              .toList(growable: false),
        );

        return ClipRect(
          child: OverflowBox(
            alignment: Alignment.topLeft,
            minWidth: viewport.width,
            maxWidth: viewport.width,
            minHeight: viewport.height,
            maxHeight: viewport.height,
            child: Transform.scale(
              alignment: Alignment.topLeft,
              scale: scale,
              child: SizedBox.fromSize(
                size: viewport,
                child: MediaQuery(data: scaledMediaQuery, child: child),
              ),
            ),
          ),
        );
      },
    );
  }

  bool _hasFiniteViewport(BoxConstraints constraints) {
    return constraints.hasBoundedWidth &&
        constraints.hasBoundedHeight &&
        constraints.maxWidth.isFinite &&
        constraints.maxHeight.isFinite;
  }

  EdgeInsets _resizeInsets(EdgeInsets value, double scale) {
    return EdgeInsets.fromLTRB(
      value.left / scale,
      value.top / scale,
      value.right / scale,
      value.bottom / scale,
    );
  }

  DisplayFeature _resizeDisplayFeature(DisplayFeature feature, double scale) {
    final bounds = feature.bounds;
    return DisplayFeature(
      bounds: Rect.fromLTRB(
        bounds.left / scale,
        bounds.top / scale,
        bounds.right / scale,
        bounds.bottom / scale,
      ),
      type: feature.type,
      state: feature.state,
    );
  }
}
