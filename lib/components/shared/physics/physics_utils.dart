import 'package:flame/components.dart';

/// Utilities for common physical vector operations.
/// 
/// Includes methods for calculating trajectories, bounce vectors,
/// and force applications.
class PhysicsUtils {
  /// Calculates the velocity needed to reach a certain height.
  static double jumpVelocity(double height, double gravity) {
    // Formula: v = sqrt(2 * g * h)
    return -1 * (2 * gravity.abs() * height.abs()); // Placeholder
  }
}
