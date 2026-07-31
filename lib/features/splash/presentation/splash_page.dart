import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/features/splash/presentation/splash_animation_timing.dart';
import 'package:linkvault/features/splash/presentation/splash_tokens.dart';
import 'package:linkvault/features/splash/presentation/widgets/animated_splash_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, this.onComplete});

  final VoidCallback? onComplete;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _completionTimer;

  @override
  void initState() {
    super.initState();
    _completionTimer = Timer(SplashAnimationTiming.totalDuration, _complete);
  }

  @override
  void dispose() {
    _completionTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashTokens.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scale = (constraints.maxWidth / SplashTokens.referenceWidth)
              .clamp(.72, 1.3)
              .toDouble();
          final badgeSize = SplashTokens.badgeSize * scale;
          final diagonal = math.sqrt(
            math.pow(constraints.maxWidth, 2) +
                math.pow(constraints.maxHeight, 2),
          );
          final expansionScale = diagonal / badgeSize * 1.08;

          return Stack(
            fit: StackFit.expand,
            children: [
              const ColoredBox(color: SplashTokens.background),
              Align(
                alignment: const Alignment(-.06, -.02),
                child: AnimatedSplashLogo(
                  scale: scale,
                  expansionScale: expansionScale,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _complete() {
    if (!mounted) return;
    final callback = widget.onComplete;
    callback == null ? context.go('/') : callback();
  }
}
