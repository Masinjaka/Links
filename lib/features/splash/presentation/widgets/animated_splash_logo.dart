import 'package:flutter/material.dart';

import 'package:linkvault/features/splash/presentation/splash_tokens.dart';
import 'package:linkvault/features/splash/presentation/widgets/animated_splash_letter.dart';
import 'package:linkvault/features/splash/presentation/widgets/splash_expanding_circle.dart';
import 'package:linkvault/features/splash/presentation/widgets/splash_link_badge.dart';

class AnimatedSplashLogo extends StatelessWidget {
  const AnimatedSplashLogo({
    super.key,
    required this.scale,
    required this.expansionScale,
  });

  final double scale;
  final double expansionScale;

  @override
  Widget build(BuildContext context) {
    const letters = ['R', 'o', 'h', 'y'];

    final badgeSize = SplashTokens.badgeSize * scale;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 0,
          child: SplashExpandingCircle(
            badgeSize: badgeSize,
            expansionScale: expansionScale,
          ),
        ),
        Semantics(
          label: 'Rohy',
          child: ExcludeSemantics(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (final (index, letter) in letters.indexed)
                  AnimatedSplashLetter(
                    letter: letter,
                    index: index,
                    scale: scale,
                  ),
                SizedBox(width: SplashTokens.badgeGap * scale),
                SplashLinkBadge(scale: scale),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
