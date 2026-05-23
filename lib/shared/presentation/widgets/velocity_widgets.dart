import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

const double kVelocityPadding = 32;
const double kVelocityGap = 10;

class VelocityPage extends StatelessWidget {
  const VelocityPage({
    super.key,
    required this.children,
    this.spacing = 15,
    this.padding = const EdgeInsets.all(kVelocityPadding),
    this.overlay,
    this.bottomInset = 40,
    this.showAccentSquare = false,
    this.accentSize = 200,
  });

  final List<Widget> children;
  final double spacing;
  final EdgeInsets padding;
  final Widget? overlay;
  final double bottomInset;
  final bool showAccentSquare;
  final double accentSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LinkVaultThemeTokens.background(context),
      body: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(child: VelocityKineticBackground()),
          ),
          Positioned.fill(
            child: ListView.separated(
              padding: padding.copyWith(bottom: padding.bottom + bottomInset),
              itemCount: children.length,
              itemBuilder: (context, index) => children[index],
              separatorBuilder: (context, index) => SizedBox(height: spacing),
            ),
          ),
          ?overlay,
        ],
      ),
    );
  }
}

class VelocityKineticBackground extends StatelessWidget {
  const VelocityKineticBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: const SizedBox(),
          ),
        ),
      ],
    );
  }
}

class VelocitySectionHeader extends StatelessWidget {
  const VelocitySectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.titleColor,
  });

  final String title;
  final String? actionLabel;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final resolvedTitleColor = titleColor ?? LinkVaultThemeTokens.ink(context);
    final titleSize = textTheme.labelLarge?.fontSize;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                title.displayText,
                style: GoogleFonts.openSans(
                  textStyle: textTheme.labelLarge,
                  color: resolvedTitleColor,
                  fontSize: titleSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            if (actionLabel != null)
              Text(
                actionLabel!.displayText,
                style: textTheme.labelLarge?.copyWith(
                  color: LinkVaultColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: LinkVaultColors.primary,
                  fontSize: 14,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class VelocityPanel extends StatelessWidget {
  const VelocityPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(32),
    this.borderColor,
    this.backgroundColor,
    this.redRight = false,
    this.redBottom = false,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color? borderColor;
  final Color? backgroundColor;
  final bool redRight;
  final bool redBottom;

  @override
  Widget build(BuildContext context) {
    final resolvedBackgroundColor =
        backgroundColor ?? LinkVaultThemeTokens.surface(context);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: resolvedBackgroundColor,
        borderRadius: LinkVaultThemeTokens.componentRadius,
        // border: Border(
        //   top: BorderSide(color: resolvedBorderColor),
        //   left: BorderSide(color: resolvedBorderColor),
        //   right: BorderSide(
        //     color: redRight ? LinkVaultColors.primary : resolvedBorderColor,
        //     width: redRight ? 4 : 1,
        //   ),
        //   bottom: BorderSide(
        //     color: redBottom ? LinkVaultColors.primary : resolvedBorderColor,
        //     width: redBottom ? 4 : 1,
        //   ),
        // ),
      ),
      child: child,
    );
  }
}

class VelocityTextInput extends StatelessWidget {
  const VelocityTextInput({
    super.key,
    required this.hint,
    this.icon,
    this.trailing,
    this.height = 55,
    this.borderColor,
    this.backgroundColor,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.fieldKey,
  });

  final String hint;
  final IconData? icon;
  final Widget? trailing;
  final double height;
  final Color? borderColor;
  final Color? backgroundColor;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Key? fieldKey;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final resolvedBorderColor =
    //     borderColor ?? LinkVaultThemeTokens.ink(context);
    final resolvedBackgroundColor =
        backgroundColor ?? LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);

    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: resolvedBackgroundColor,
        borderRadius: LinkVaultThemeTokens.componentRadius,
        // border: Border(
        //   top: BorderSide(color: resolvedBorderColor),
        //   left: BorderSide(color: resolvedBorderColor),
        //   right: BorderSide(color: resolvedBorderColor),
        //   bottom: BorderSide(color: resolvedBorderColor),
        // ),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: LinkVaultThemeTokens.ink(context), size: 25),
            const SizedBox(width: 25),
          ],
          Expanded(
            child: TextField(
              key: fieldKey,
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              cursorColor: LinkVaultColors.primary,
              style: textTheme.bodyLarge?.copyWith(
                color: ink,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(hintText: hint.displayText),
            ),
          ),
          if (trailing != null) ...[const SizedBox(width: 16), trailing!],
        ],
      ),
    );
  }
}

class VelocityChip extends StatelessWidget {
  const VelocityChip({
    super.key,
    required this.label,
    this.selected = false,
    this.showClose = false,
    this.icon,
    this.onTap,
  });

  final String label;
  final bool selected;
  final bool showClose;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ink = LinkVaultThemeTokens.ink(context);
    final surface = LinkVaultThemeTokens.surface(context);
    final foreground = selected ? LinkVaultColors.onPrimary : ink;
    final iconColor = selected ? LinkVaultColors.onPrimary : ink;

    return Material(
      color: selected ? LinkVaultColors.primary : surface,
      borderRadius: LinkVaultThemeTokens.componentRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: LinkVaultThemeTokens.componentRadius,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: LinkVaultThemeTokens.componentRadius,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, color: iconColor, size: 16),
                const SizedBox(width: 8),
              ],
              Text(
                label.displayText,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: foreground,
                  fontSize: 14,
                ),
              ),
              if (showClose) ...[
                const SizedBox(width: 8),
                Icon(Icons.close_rounded, color: foreground, size: 15),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class VelocityButton extends StatelessWidget {
  const VelocityButton({
    super.key,
    required this.label,
    this.icon,
    this.filled = true,
    this.onPressed,
    this.height = 58,
    this.fillColor,
    this.foregroundColor,
    this.borderColor,
    this.shadowColor,
  });

  final String label;
  final IconData? icon;
  final bool filled;
  final VoidCallback? onPressed;
  final double height;
  final Color? fillColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final resolvedFillColor = fillColor ?? LinkVaultColors.primary;
    final resolvedForegroundColor =
        foregroundColor ??
        (filled
            ? LinkVaultColors.onPrimary
            : LinkVaultThemeTokens.ink(context));
    final resolvedBorderColor =
        borderColor ?? LinkVaultThemeTokens.ink(context);
    final resolvedShadowColor =
        shadowColor ?? LinkVaultThemeTokens.ink(context);

    return Material(
      color: Colors.transparent,
      borderRadius: LinkVaultThemeTokens.componentRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        borderRadius: LinkVaultThemeTokens.componentRadius,
        child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: filled ? resolvedFillColor : Colors.transparent,
            borderRadius: LinkVaultThemeTokens.componentRadius,
            border: filled
                ? null
                : Border.all(color: resolvedBorderColor, width: 2),
            boxShadow: filled
                ? [
                    BoxShadow(
                      color: resolvedShadowColor,
                      offset: Offset(4, 4),
                      blurRadius: 0,
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, color: resolvedForegroundColor, size: 20),
                const SizedBox(width: 10),
              ],
              Text(
                label.displayText,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: resolvedForegroundColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VelocitySettingRow extends StatelessWidget {
  const VelocitySettingRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final surface = LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: LinkVaultColors.primary)),
      ),
      child: Row(
        children: [
          Container(
            width: 78,
            height: 78,
            decoration: BoxDecoration(
              color: surface,
              border: Border.all(color: ink),
              borderRadius: LinkVaultThemeTokens.componentRadius,
            ),
            child: Icon(icon, color: LinkVaultColors.primary, size: 30),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.displayText,
                  style: textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle.displayText,
                  style: textTheme.labelLarge?.copyWith(
                    color: LinkVaultColors.secondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          trailing ??
              const Icon(
                Icons.chevron_right_rounded,
                color: LinkVaultColors.secondary,
                size: 34,
              ),
        ],
      ),
    );
  }
}

class VelocityStatBox extends StatelessWidget {
  const VelocityStatBox({
    super.key,
    required this.label,
    required this.value,
    required this.suffix,
  });

  final String label;
  final String value;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return VelocityPanel(
      redRight: false,
      redBottom: false,
      borderColor: LinkVaultColors.ink,
      padding: const EdgeInsets.all(32),
      backgroundColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.displayText,
            style: textTheme.labelLarge?.copyWith(
              color: LinkVaultColors.secondary,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: textTheme.headlineMedium?.copyWith(fontSize: 24),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  suffix,
                  style: textTheme.labelLarge?.copyWith(
                    color: LinkVaultColors.primary,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VelocityBarChart extends StatelessWidget {
  const VelocityBarChart({
    super.key,
    required this.values,
    required this.labels,
    this.height = 300,
  });

  final List<double> values;
  final List<String> labels;
  final double height;

  @override
  Widget build(BuildContext context) {
    return VelocityPanel(
      borderColor: LinkVaultColors.ink,
      redRight: false,
      redBottom: false,
      padding: const EdgeInsets.fromLTRB(32, 40, 32, 24),
      child: SizedBox(
        height: height,
        child: CustomPaint(
          painter: _BarChartPainter(values: values, labels: labels),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

class VelocityLineChart extends StatelessWidget {
  const VelocityLineChart({
    super.key,
    required this.values,
    required this.labels,
    this.height = 300,
  });

  final List<double> values;
  final List<String> labels;
  final double height;

  @override
  Widget build(BuildContext context) {
    return VelocityPanel(
      borderColor: LinkVaultColors.ink,
      redRight: false,
      redBottom: false,
      padding: const EdgeInsets.fromLTRB(32, 36, 32, 24),
      child: SizedBox(
        height: height,
        child: CustomPaint(
          painter: _LineChartPainter(values: values, labels: labels),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

class VelocityToggle extends StatelessWidget {
  const VelocityToggle({super.key, this.value = true});

  final bool value;

  @override
  Widget build(BuildContext context) {
    final surface = LinkVaultThemeTokens.surface(context);
    return Container(
      width: 102,
      height: 60,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: value ? LinkVaultColors.primary : surface,
        border: Border.all(color: LinkVaultColors.primary, width: 2),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Align(
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: LinkVaultColors.onPrimary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BarChartPainter extends CustomPainter {
  const _BarChartPainter({required this.values, required this.labels});

  final List<double> values;
  final List<String> labels;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = LinkVaultColors.primary;
    final labelPainter = TextPainter(textDirection: TextDirection.ltr);
    final maxValue = values.reduce(math.max);
    final chartHeight = size.height - 34;
    final slot = size.width / values.length;
    final barWidth = math.min(42.0, slot * .42);

    for (var index = 0; index < values.length; index++) {
      final barHeight = chartHeight * (values[index] / maxValue);
      final left = slot * index + (slot - barWidth) / 2;
      canvas.drawRect(
        Rect.fromLTWH(left, chartHeight - barHeight, barWidth, barHeight),
        paint,
      );

      labelPainter.text = TextSpan(
        text: labels[index],
        style: TextStyle(
          color: LinkVaultColors.secondary,
          fontSize: 12,
          fontFamily: GoogleFonts.nunito().fontFamily,
        ),
      );
      labelPainter.layout();
      labelPainter.paint(
        canvas,
        Offset(
          slot * index + (slot - labelPainter.width) / 2,
          chartHeight + 12,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BarChartPainter oldDelegate) =>
      oldDelegate.values != values || oldDelegate.labels != labels;
}

class _LineChartPainter extends CustomPainter {
  const _LineChartPainter({required this.values, required this.labels});

  final List<double> values;
  final List<String> labels;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) {
      return;
    }

    final chartHeight = size.height - 40;
    final step = values.length == 1 ? 0.0 : size.width / (values.length - 1);
    final maxValue = values.reduce(math.max);
    final minValue = values.reduce(math.min);
    final valueRange = maxValue - minValue;
    final points = <Offset>[
      for (var index = 0; index < values.length; index++)
        Offset(
          index * step,
          chartHeight -
              (valueRange == 0 ? .5 : (values[index] - minValue) / valueRange) *
                  chartHeight *
                  .78 -
              chartHeight * .08,
        ),
    ];

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var index = 1; index < points.length; index++) {
      path.lineTo(points[index].dx, points[index].dy);
    }

    final fillPath = Path.from(path)
      ..lineTo(size.width, chartHeight)
      ..lineTo(0, chartHeight)
      ..close();

    canvas.drawPath(
      fillPath,
      Paint()..color = LinkVaultColors.primary.withValues(alpha: .18),
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = LinkVaultColors.primary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
    );

    final labelPainter = TextPainter(textDirection: TextDirection.ltr);
    for (var index = 0; index < labels.length; index++) {
      labelPainter.text = TextSpan(
        text: labels[index],
        style: TextStyle(
          color: LinkVaultColors.secondary,
          fontSize: 12,
          fontFamily: GoogleFonts.nunito().fontFamily,
        ),
      );
      labelPainter.layout();
      labelPainter.paint(
        canvas,
        Offset(index * step - labelPainter.width / 2, chartHeight + 14),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) =>
      oldDelegate.values != values || oldDelegate.labels != labels;
}
