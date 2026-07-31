import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:linkvault/features/splash/presentation/splash_animation_timing.dart';
import 'package:linkvault/features/splash/presentation/splash_tokens.dart';

class AnimatedSplashLetter extends StatelessWidget {
  const AnimatedSplashLetter({
    super.key,
    required this.letter,
    required this.index,
    required this.scale,
  });

  final String letter;
  final int index;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Text(
          letter,
          key: Key('splash-letter-$letter'),
          style: TextStyle(
            color: SplashTokens.foreground,
            fontFamily: 'OpenSans',
            fontSize: SplashTokens.logoFontSize * scale,
            fontWeight: FontWeight.w900,
            height: .94,
            letterSpacing: -2.4 * scale,
          ),
        )
        .animate(delay: SplashAnimationTiming.letterDelay(index))
        .fadeIn(duration: SplashAnimationTiming.letterDuration)
        .slideY(
          begin: 1.15,
          end: 0,
          duration: SplashAnimationTiming.letterDuration,
          curve: Curves.easeOutCubic,
        );
  }
}
