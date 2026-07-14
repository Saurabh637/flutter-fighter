/// Global constants used for physical calculations across the game.
class PhysicsConstants {
  /// The standard gravity force.
  static const double gravity = 1200.0;
  
  /// The total height of the game world.
  static const double worldHeight = 1000.0;
  
  /// The Y-coordinate where the ground begins.
  /// Calculated as worldHeight - Ground.groundHeight.
  static const double groundLevel = 800.0;
}
