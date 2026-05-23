import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

class LinkDetailsTitleBanner extends StatelessWidget {
  const LinkDetailsTitleBanner({super.key, required this.title, this.style});

  final String title;
  final TextStyle? style;

  static const double _horizontalPadding = 32;
  static const double _verticalPadding = 18;
  static const double _rightBottomLift = 12;
  static const double _lineGap = 4;

  @override
  Widget build(BuildContext context) {
    final textStyle =
        style ??
        Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: LinkVaultColors.onPrimary,
          fontSize: 24,
        ) ??
        TextStyle(color: LinkVaultColors.onPrimary, fontSize: 24);
    final textDirection = Directionality.of(context);
    final textScaler = MediaQuery.textScalerOf(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.hasBoundedWidth
              ? constraints.maxWidth
              : 720.0;
          final layout = _BannerTextLayout.resolve(
            title: title.toUpperCase().displayText,
            style: textStyle,
            textDirection: textDirection,
            textScaler: textScaler,
            maxWidth: maxWidth,
            horizontalPadding: _horizontalPadding,
            verticalPadding: _verticalPadding,
            rightBottomLift: _rightBottomLift,
            lineGap: _lineGap,
          );

          return SizedBox(
            width: double.infinity,
            height: layout.height,
            child: CustomPaint(
              painter: _TitleBannerPainter(
                color: LinkVaultThemeTokens.ink(context),
                rightBottomLift: _rightBottomLift,
              ),
              child: Stack(
                children: [
                  for (final word in layout.words)
                    Positioned(
                      left: word.left,
                      top: word.top,
                      width: word.width,
                      height: layout.lineHeight,
                      child: Text(
                        word.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BannerTextLayout {
  const _BannerTextLayout({
    required this.width,
    required this.height,
    required this.lineHeight,
    required this.words,
  });

  final double width;
  final double height;
  final double lineHeight;
  final List<_PositionedBannerWord> words;

  static _BannerTextLayout resolve({
    required String title,
    required TextStyle style,
    required TextDirection textDirection,
    required TextScaler textScaler,
    required double maxWidth,
    required double horizontalPadding,
    required double verticalPadding,
    required double rightBottomLift,
    required double lineGap,
  }) {
    final tokens = title
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
    final words = tokens.isEmpty ? <String>['UNTITLED'] : tokens;
    final lineHeight = _measure('Hg', style, textDirection, textScaler).height;
    final measuredSpaceWidth = _measure(
      ' ',
      style,
      textDirection,
      textScaler,
    ).width;
    final spaceWidth = math.max(measuredSpaceWidth, 8);
    final contentMaxWidth = math.max(0.0, maxWidth - (horizontalPadding * 2));

    final lines = <_BannerLine>[];
    var lineWords = <_MeasuredBannerWord>[];
    var lineWidth = 0.0;

    for (final word in words) {
      final measuredWidth = _measure(
        word,
        style,
        textDirection,
        textScaler,
      ).width;
      final wordWidth = math.min(measuredWidth, contentMaxWidth).toDouble();
      final nextWidth = lineWords.isEmpty
          ? wordWidth
          : lineWidth + spaceWidth + wordWidth;

      if (lineWords.isNotEmpty && nextWidth > contentMaxWidth) {
        lines.add(_BannerLine(words: lineWords, width: lineWidth));
        lineWords = <_MeasuredBannerWord>[];
        lineWidth = 0;
      }

      final left = lineWords.isEmpty ? 0.0 : lineWidth + spaceWidth;
      lineWords.add(
        _MeasuredBannerWord(text: word, left: left, width: wordWidth),
      );
      lineWidth = left + wordWidth;
    }

    if (lineWords.isNotEmpty) {
      lines.add(_BannerLine(words: lineWords, width: lineWidth));
    }

    final widestLine = lines.fold<double>(
      0,
      (current, line) => math.max(current, line.width),
    );
    final width = math.min(maxWidth, widestLine + (horizontalPadding * 2));
    final height =
        (verticalPadding * 2) +
        (lines.length * lineHeight) +
        math.max(0, lines.length - 1).toDouble() * lineGap +
        rightBottomLift;
    final positionedWords = <_PositionedBannerWord>[];

    for (var lineIndex = 0; lineIndex < lines.length; lineIndex += 1) {
      final line = lines[lineIndex];
      final lineTop = verticalPadding + lineIndex * (lineHeight + lineGap);

      for (final word in line.words) {
        final left = horizontalPadding + word.left;
        final wordCenterX = left + (word.width / 2);
        final centerlineLift = (wordCenterX / width) * (rightBottomLift / 2);

        positionedWords.add(
          _PositionedBannerWord(
            text: word.text,
            left: left,
            top: lineTop + (rightBottomLift / 2) - centerlineLift,
            width: word.width,
          ),
        );
      }
    }

    return _BannerTextLayout(
      width: width,
      height: height,
      lineHeight: lineHeight,
      words: positionedWords,
    );
  }

  static Size _measure(
    String text,
    TextStyle style,
    TextDirection textDirection,
    TextScaler textScaler,
  ) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: textDirection,
      textScaler: textScaler,
      maxLines: 1,
    )..layout();

    return painter.size;
  }
}

class _BannerLine {
  const _BannerLine({required this.words, required this.width});

  final List<_MeasuredBannerWord> words;
  final double width;
}

class _MeasuredBannerWord {
  const _MeasuredBannerWord({
    required this.text,
    required this.left,
    required this.width,
  });

  final String text;
  final double left;
  final double width;
}

class _PositionedBannerWord {
  const _PositionedBannerWord({
    required this.text,
    required this.left,
    required this.top,
    required this.width,
  });

  final String text;
  final double left;
  final double top;
  final double width;
}

class _TitleBannerPainter extends CustomPainter {
  const _TitleBannerPainter({
    required this.color,
    required this.rightBottomLift,
  });

  final Color color;
  final double rightBottomLift;

  @override
  void paint(Canvas canvas, Size size) {
    final lift = math.min(rightBottomLift, size.height * .35);
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - lift)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _TitleBannerPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.rightBottomLift != rightBottomLift;
  }
}
