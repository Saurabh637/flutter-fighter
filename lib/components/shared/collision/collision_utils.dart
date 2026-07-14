import 'package:flame/components.dart';

/// Static utility methods for geometric collision checks.
/// 
/// Contains algorithms for manual overlap tests and distance
/// checks between different shapes.
class CollisionUtils {
  /// Checks if two rectangles overlap.
  static bool checkOverlap(Rect a, Rect b) {
    return a.overlaps(b);
  }
}
