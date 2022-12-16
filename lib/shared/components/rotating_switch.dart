import 'package:flutter/material.dart';

class RotatingSwitch extends StatelessWidget {
  const RotatingSwitch({
    super.key,
    required this.firstChild,
    required this.secondChild,
    required this.showFirst,
  });

  final Widget firstChild;
  final Widget secondChild;
  final bool showFirst;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, anim) => RotationTransition(
        turns: child.key == firstChild.key
            ? Tween<double>(begin: 0.5, end: 0).animate(anim)
            : Tween<double>(begin: 0, end: 0.5).animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: ScaleTransition(
            scale: anim,
            child: child,
          ),
        ),
      ),
      child: showFirst ? firstChild : secondChild,
    );
  }
}
