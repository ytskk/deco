import 'package:flutter/material.dart';

const defaultCardMargin = EdgeInsets.symmetric(
  horizontal: 6,
  vertical: 8,
);

const double defaultBorderRadius = 24;
const defaultShadowIntense = ShadowIntense.light;

class CardAlternative extends StatelessWidget {
  const CardAlternative({
    super.key,
    required this.child,
    this.color,
    this.margin = defaultCardMargin,
    this.borderRadius = defaultBorderRadius,
    this.shadowIntense = defaultShadowIntense,
  });

  final Widget child;
  final Color? color;
  final EdgeInsets margin;
  final double borderRadius;
  final ShadowIntense shadowIntense;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).colorScheme.surface;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? cardColor,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(shadowIntense.value),
                  blurRadius: 16,
                  offset: const Offset(2, 5),
                ),
              ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: child,
      ),
    );
  }
}

enum ShadowIntense {
  light(0.07),
  medium(0.17),
  heavy(0.27);

  const ShadowIntense(this.value);

  final double value;
}
