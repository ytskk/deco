import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class DynamicColor extends Color {
  const DynamicColor({
    required this.color,
    required this.darkColor,
  }) : super(0);

  final Color color;
  final Color darkColor;

  Color resolveFrom(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return brightness == Brightness.dark ? darkColor : color;
  }
}
