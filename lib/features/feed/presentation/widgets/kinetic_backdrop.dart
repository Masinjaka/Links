import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class KineticBackdrop extends StatefulWidget {
  const KineticBackdrop({super.key});

  @override
  State<KineticBackdrop> createState() => _KineticBackdropState();
}

class _KineticBackdropState extends State<KineticBackdrop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: (10000 / _EmberFlowShaderProperties.speed).round(),
      ),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _KineticBackdropPainter(
              time: _controller.value,
              background: LinkVaultThemeTokens.background(context),
              surface: LinkVaultThemeTokens.surface(context),
            ),
            child: child,
          );
        },
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _KineticBackdropPainter extends CustomPainter {
  const _KineticBackdropPainter({
    required this.time,
    required this.background,
    required this.surface,
  });

  final double time;
  final Color background;
  final Color surface;

  @override
  void paint(Canvas canvas, Size size) {
    assert(_EmberFlowShaderProperties.preset == 'Ember Flow');
    assert(_EmberFlowShaderProperties.shaderType == 'turbulence');

    final rect = Offset.zero & size;
    final basePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          background,
          surface,
          LinkVaultColors.primary.withValues(
            alpha: _EmberFlowShaderProperties.primaryOpacity,
          ),
        ],
        transform: const GradientRotation(
          _EmberFlowShaderProperties.gradientAngleRadians,
        ),
      ).createShader(rect);

    canvas.drawRect(rect, basePaint);

    final cellSize = math.max(16.0, size.shortestSide / 26);
    final columns = (size.width / cellSize).ceil() + 1;
    final rows = (size.height / cellSize).ceil() + 1;
    final paint = Paint();
    final animatedTime = time * math.pi * 2;

    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        final uv = Offset(column / columns, row / rows);
        final value = _turbulence(uv, animatedTime);
        final color = _applyMaterialLight(_emberColor(value, uv), value);

        if (color.a == 0) {
          continue;
        }

        paint.color = color;
        canvas.drawRect(
          Rect.fromLTWH(
            column * cellSize,
            row * cellSize,
            cellSize + 1,
            cellSize + 1,
          ),
          paint,
        );
      }
    }
  }

  double _turbulence(Offset uv, double animatedTime) {
    final drift = Offset(
      math.cos(animatedTime) * .08,
      math.sin(animatedTime * .83) * .08,
    );
    final flow = Offset(
      uv.dx * _EmberFlowShaderProperties.noiseScale +
          drift.dx +
          animatedTime * .16,
      uv.dy * _EmberFlowShaderProperties.noiseScale +
          drift.dy -
          animatedTime * .11,
    );
    final warped = Offset(
      flow.dx + math.sin((flow.dy + animatedTime) * 1.7) * .34,
      flow.dy + math.cos((flow.dx - animatedTime) * 1.3) * .28,
    );
    final octaveCount = _EmberFlowShaderProperties.octaves.floor();
    final octaveRemainder = _EmberFlowShaderProperties.octaves - octaveCount;
    var frequency = _EmberFlowShaderProperties.baseFrequency;
    var amplitude = 1.0;
    var total = 0.0;
    var normalizer = 0.0;

    for (var octave = 0; octave < octaveCount; octave++) {
      total +=
          (_valueNoise(warped.dx * frequency, warped.dy * frequency) * 2 - 1)
              .abs() *
          amplitude;
      normalizer += amplitude;
      frequency *= 2;
      amplitude *= .5;
    }

    if (octaveRemainder > 0) {
      total +=
          (_valueNoise(warped.dx * frequency, warped.dy * frequency) * 2 - 1)
              .abs() *
          amplitude *
          octaveRemainder;
      normalizer += amplitude * octaveRemainder;
    }

    final normalized = normalizer == 0 ? 0.0 : total / normalizer;
    final exposed = math
        .pow(normalized, 1 / _EmberFlowShaderProperties.exposure)
        .toDouble();
    final contrasted =
        ((exposed - .5) * _EmberFlowShaderProperties.contrast + .5)
            .clamp(0.0, 1.0)
            .toDouble();

    return (contrasted + _ditherOffset(uv) * _EmberFlowShaderProperties.dither)
        .clamp(0.0, 1.0)
        .toDouble();
  }

  Color _emberColor(double value, Offset uv) {
    final intensity = _EmberFlowShaderProperties.intensity;
    final edgeMask = _edgeFadeMask(uv);

    if (value > .72) {
      final color = Color.lerp(
        Colors.transparent,
        LinkVaultColors.primary.withValues(
          alpha: _EmberFlowShaderProperties.primaryOpacity,
        ),
        ((value - .72) / .28 * intensity).clamp(0.0, 1.0),
      )!;

      return color.withValues(alpha: color.a * edgeMask);
    }

    if (value > .45) {
      final color = Color.lerp(
        Colors.transparent,
        surface,
        (_softenedBand(value, .45, .72) * intensity).clamp(0.0, 1.0),
      )!;

      return color.withValues(alpha: color.a * edgeMask);
    }

    final color = Color.lerp(
      Colors.transparent,
      background,
      ((.45 - value) / .45 * intensity * .72).clamp(0.0, 1.0),
    )!;

    return color.withValues(alpha: color.a * edgeMask);
  }

  Color _applyMaterialLight(Color color, double value) {
    final normalLift = _EmberFlowShaderProperties.bumpStrength;
    final lightMagnitude = math.sqrt(
      math.pow(_EmberFlowShaderProperties.lightX, 2) +
          math.pow(_EmberFlowShaderProperties.lightY, 2) +
          math.pow(_EmberFlowShaderProperties.lightZ, 2),
    );
    final diffuse =
        _EmberFlowShaderProperties.ambient +
        normalLift *
            _EmberFlowShaderProperties.lightIntensity *
            lightMagnitude *
            (1 - _EmberFlowShaderProperties.roughness);
    final specular =
        normalLift *
        _EmberFlowShaderProperties.specular *
        _EmberFlowShaderProperties.metallic *
        math.pow(value, _EmberFlowShaderProperties.shininess).toDouble();
    final highlight = (diffuse - _EmberFlowShaderProperties.ambient + specular)
        .clamp(0.0, 1.0)
        .toDouble();

    return Color.lerp(
      color,
      LinkVaultColors.onPrimary,
      highlight,
    )!.withValues(alpha: color.a);
  }

  double _valueNoise(double x, double y) {
    final xi = x.floor();
    final yi = y.floor();
    final xf = x - xi;
    final yf = y - yi;
    final top = _lerp(_hash(xi, yi), _hash(xi + 1, yi), _smoothstep(xf));
    final bottom = _lerp(
      _hash(xi, yi + 1),
      _hash(xi + 1, yi + 1),
      _smoothstep(xf),
    );

    return _lerp(top, bottom, _smoothstep(yf));
  }

  double _hash(int x, int y) {
    final n = math.sin(x * 127.1 + y * 311.7) * 43758.5453123;

    return n - n.floor();
  }

  double _smoothstep(double value) {
    return value * value * (3 - 2 * value);
  }

  double _lerp(double a, double b, double t) => a + (b - a) * t;

  double _softenedBand(double value, double start, double end) {
    final band = ((value - start) / (end - start)).clamp(0.0, 1.0).toDouble();
    final softness = _EmberFlowShaderProperties.softness;

    return softness == 0 ? band : _smoothstep(_lerp(band, .5, softness));
  }

  double _edgeFadeMask(Offset uv) {
    final edgeFade = _EmberFlowShaderProperties.edgeFade;

    if (edgeFade == 0) {
      return 1;
    }

    final edgeDistance = math.min(
      math.min(uv.dx, 1 - uv.dx),
      math.min(uv.dy, 1 - uv.dy),
    );

    return (edgeDistance / edgeFade).clamp(0.0, 1.0).toDouble();
  }

  double _ditherOffset(Offset uv) {
    final scale = _EmberFlowShaderProperties.ditherScale;

    return _hash(
          (uv.dx * scale * 1024).floor(),
          (uv.dy * scale * 1024).floor(),
        ) -
        .5;
  }

  @override
  bool shouldRepaint(covariant _KineticBackdropPainter oldDelegate) {
    return oldDelegate.time != time ||
        oldDelegate.background != background ||
        oldDelegate.surface != surface;
  }
}

class _EmberFlowShaderProperties {
  const _EmberFlowShaderProperties._();

  static const preset = 'Ember Flow';
  static const shaderType = 'turbulence';
  static const intensity = .3;
  static const dither = 0.0;
  static const ditherScale = 1.0;
  static const baseFrequency = 1.3;
  static const noiseScale = 8.8;
  static const octaves = 6.2;
  static const softness = 0.0;
  static const exposure = 1.0;
  static const contrast = 1.0;
  static const edgeFade = 0.0;
  static const bumpStrength = 0.0;
  static const lightX = .4;
  static const lightY = .6;
  static const lightZ = .8;
  static const lightIntensity = 1.3;
  static const ambient = .3;
  static const specular = .4;
  static const shininess = 14.7;
  static const metallic = .4;
  static const roughness = .3;
  static const gradientAngleRadians = 135 * math.pi / 180;
  static const primaryOpacity = .2;
  static const speed = .6;
}
