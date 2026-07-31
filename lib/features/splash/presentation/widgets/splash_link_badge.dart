import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:linkvault/features/splash/presentation/splash_animation_timing.dart';
import 'package:linkvault/features/splash/presentation/splash_tokens.dart';

class SplashLinkBadge extends StatelessWidget {
  const SplashLinkBadge({super.key, required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    final size = SplashTokens.badgeSize * scale;

    return Container(
          key: const Key('splash-link-badge'),
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: SplashTokens.accent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Icon(
              Icons.link_rounded,
              color: SplashTokens.badgeForeground,
              size: size * .72,
            ),
          ),
        )
        .animate(delay: SplashAnimationTiming.iconDelay)
        .fadeIn(duration: SplashAnimationTiming.iconDuration)
        .slideY(
          begin: 1.15,
          end: 0,
          duration: SplashAnimationTiming.iconDuration,
          curve: Curves.easeOutCubic,
        )
        .scaleXY(
          begin: .86,
          end: 1,
          duration: SplashAnimationTiming.iconDuration,
          curve: Curves.easeOutBack,
        );
  }
}
