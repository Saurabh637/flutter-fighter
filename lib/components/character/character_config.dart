import 'package:flame/components.dart';

/// Configuration constants for character physics and movement.
class CharacterConfig {
  /// Default gravity applied to all characters.
  static const double gravity = 800.0;
  
  /// Default size for a character.
  static final Vector2 defaultSize = Vector2(50, 100);
  
  /// Standard movement speed.
  static const double defaultMoveSpeed = 300.0;
  
  /// Standard jump force.
  static const double defaultJumpForce = -450.0;
}
