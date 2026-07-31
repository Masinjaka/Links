import 'dart:ui';

import 'package:flutter/material.dart';

class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    required this.enabled,
    required this.borderRadius,
    required this.color,
    required this.glassColor,
    required this.child,
    this.border,
    this.width,
    this.height,
    this.padding,
    this.backdropKey,
    this.surfaceKey,
  });

  final bool enabled;
  final BorderRadius borderRadius;
  final Color color;
  final Color glassColor;
  final Widget child;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Key? backdropKey;
  final Key? surfaceKey;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        key: backdropKey,
        enabled: enabled,
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: AnimatedContainer(
          key: surfaceKey,
          duration: const Duration(milliseconds: 180),
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: enabled ? glassColor : color,
            borderRadius: borderRadius,
            border: enabled ? border : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
