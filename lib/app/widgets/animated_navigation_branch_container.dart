import 'package:flutter/material.dart';

class AnimatedNavigationBranchContainer extends StatelessWidget {
  const AnimatedNavigationBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  static const duration = Duration(milliseconds: 260);
  static const _travel = .06;

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (final (index, child) in children.indexed)
          Positioned.fill(
            child: AnimatedSlide(
              key: Key('navigation-branch-$index'),
              offset: _offsetFor(index),
              duration: duration,
              curve: Curves.easeOutCubic,
              child: AnimatedOpacity(
                opacity: index == currentIndex ? 1 : 0,
                duration: duration,
                curve: Curves.easeOutCubic,
                child: IgnorePointer(
                  ignoring: index != currentIndex,
                  child: ExcludeSemantics(
                    excluding: index != currentIndex,
                    child: TickerMode(
                      enabled: index == currentIndex,
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Offset _offsetFor(int index) {
    if (index == currentIndex) return Offset.zero;
    return Offset(index < currentIndex ? -_travel : _travel, 0);
  }
}
