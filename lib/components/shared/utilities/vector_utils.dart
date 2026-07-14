import 'package:flame/components.dart';

/// Helper methods for working with [Vector2] and geometry.
class VectorUtils {
  /// Calculates the distance between two vectors.
  static double distance(Vector2 a, Vector2 b) {
    return a.distanceTo(b);
  }
}
