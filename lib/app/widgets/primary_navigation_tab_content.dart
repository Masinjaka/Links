import 'package:flutter/material.dart';

class PrimaryNavigationTabContent extends StatelessWidget {
  const PrimaryNavigationTabContent({
    super.key,
    required this.icon,
    required this.label,
    required this.active,
    required this.color,
  });

  final IconData icon;
  final String label;
  final bool active;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      width: active ? 108 : 20,
      height: 20,
      child: ClipRect(
        child: OverflowBox(
          alignment: Alignment.centerLeft,
          minWidth: 108,
          maxWidth: 108,
          minHeight: 20,
          maxHeight: 20,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: active ? Alignment.center : Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 20, color: color),
                const SizedBox(width: 4),
                AnimatedOpacity(
                  opacity: active ? 1 : 0,
                  duration: const Duration(milliseconds: 160),
                  child: Text(
                    label,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
