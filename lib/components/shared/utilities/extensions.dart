import 'package:flame/components.dart';

/// Useful extensions for Flame and Flutter classes.
extension Vector2Extension on Vector2 {
  /// Returns a copy of this vector with a new X value.
  Vector2 withX(double x) => Vector2(x, y);
  
  /// Returns a copy of this vector with a new Y value.
  Vector2 withY(double y) => Vector2(x, y);
}
