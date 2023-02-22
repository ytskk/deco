import 'dart:ui';

import 'package:flutter/widgets.dart';

List<BoxShadow> generateShadow([Color color = const Color(0xFF000000)]) {
  return [
    BoxShadow(
      color: color.withOpacity(0.0197),
      blurRadius: 2.21,
      offset: const Offset(0, 2.77),
    ),
    BoxShadow(
      color: color.withOpacity(0.0283),
      blurRadius: 5.32,
      offset: const Offset(0, 6.65),
    ),
    BoxShadow(
      color: color.withOpacity(0.035),
      blurRadius: 10,
      offset: const Offset(0, 12.5),
    ),
    BoxShadow(
      color: color.withOpacity(0.0417),
      blurRadius: 17.87,
      offset: const Offset(0, 22.34),
    ),
    BoxShadow(
      color: color.withOpacity(0.0503),
      blurRadius: 33.42,
      offset: const Offset(0, 41.78),
    ),
  ];
}
