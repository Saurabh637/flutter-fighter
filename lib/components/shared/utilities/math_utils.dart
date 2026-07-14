import 'dart:math';

/// General purpose math utility functions.
class MathUtils {
  /// Linearly interpolates between two values.
  static double lerp(double a, double b, double t) {
    return a + (b - a) * t.clamp(0.0, 1.0);
  }
}
