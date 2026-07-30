import 'dart:ui' show DisplayFeature;

import 'package:flutter/material.dart';

/// Applies one visual-density ratio to the complete app, including overlays.
class CompactAppViewport extends StatelessWidget {
  const CompactAppViewport({
    super.key,
    required this.child,
    this.scale = defaultScale,
  }) : assert(scale > 0 && scale <= 1);

  static const double defaultScale = .9;

  final Widget child;
  final double scale;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (!_hasFiniteViewport(constraints) || scale == 1) return child;

        final viewport = Size(
          constraints.maxWidth / scale,
          constraints.maxHeight / scale,
        );
        final scaledMediaQuery = mediaQuery.copyWith(
          size: viewport,
          padding: _expandInsets(mediaQuery.padding),
          viewPadding: _expandInsets(mediaQuery.viewPadding),
          viewInsets: _expandInsets(mediaQuery.viewInsets),
          systemGestureInsets: _expandInsets(mediaQuery.systemGestureInsets),
          displayFeatures: mediaQuery.displayFeatures
              .map(_expandDisplayFeature)
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

  EdgeInsets _expandInsets(EdgeInsets value) {
    return EdgeInsets.fromLTRB(
      value.left / scale,
      value.top / scale,
      value.right / scale,
      value.bottom / scale,
    );
  }

  DisplayFeature _expandDisplayFeature(DisplayFeature feature) {
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
