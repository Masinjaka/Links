import 'package:flutter/material.dart';
import 'package:linkvault/app/linkvault_theme.dart';

class SquareButton extends StatefulWidget {
  const SquareButton({
    super.key,
    this.onPressed,
    this.icon = Icons.add_rounded,
    this.tooltip,
    this.size = 52,
    this.backgroundColor,
    this.iconColor,
    this.shadowed = true,
    this.borderColor,
  });
  final void Function()? onPressed;
  final IconData icon;
  final String? tooltip;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool? shadowed;
  final Color? borderColor;

  @override
  State<SquareButton> createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  @override
  Widget build(BuildContext context) {
    final themeInk = LinkVaultThemeTokens.ink(context);
    final resolvedBackgroundColor =
        widget.backgroundColor ?? LinkVaultColors.primary;
    final resolvedIconColor = resolvedBackgroundColor == LinkVaultColors.primary
        ? (widget.iconColor ?? LinkVaultColors.onPrimary)
        : themeInk;
    // final resolvedBorderColor =
    //     widget.borderColor == null || widget.borderColor == LinkVaultColors.ink
    //     ? themeInk
    //     : widget.borderColor!;

    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: resolvedBackgroundColor,
        borderRadius: LinkVaultThemeTokens.componentRadius,
        boxShadow: widget.shadowed != null && widget.shadowed == true
            ? [BoxShadow(color: themeInk, offset: Offset(3, 3), blurRadius: 0)]
            : [],
        // border: Border.all(color: resolvedBorderColor),
      ),
      child: IconButton(
        onPressed: widget.onPressed,
        tooltip: widget.tooltip,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        constraints: const BoxConstraints(),
        icon: Icon(widget.icon, color: resolvedIconColor, size: 28),
      ),
    );
  }
}
