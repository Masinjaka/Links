import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:linkvault/features/splash/presentation/splash_animation_timing.dart';
import 'package:linkvault/features/splash/presentation/splash_tokens.dart';

class SplashExpandingCircle extends StatelessWidget {
  const SplashExpandingCircle({
    super.key,
    required this.badgeSize,
    required this.expansionScale,
  });

  final double badgeSize;
  final double expansionScale;

  @override
  Widget build(BuildContext context) {
    return Container(
          key: const Key('splash-expanding-circle'),
          width: badgeSize,
          height: badgeSize,
          decoration: const BoxDecoration(
            color: SplashTokens.accent,
            shape: BoxShape.circle,
          ),
        )
        .animate()
        .fadeIn(
          delay: SplashAnimationTiming.expansionDelay,
          duration: const Duration(milliseconds: 1),
        )
        .scaleXY(
          begin: 1,
          end: expansionScale,
          delay: SplashAnimationTiming.expansionDelay,
          duration: SplashAnimationTiming.expansionDuration,
          curve: Curves.easeInOutCubic,
        );
  }
}
