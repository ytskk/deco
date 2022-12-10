import 'dart:math';

extension NumExtension on num {
  num clampMin(num min) => max(this, min);
}
