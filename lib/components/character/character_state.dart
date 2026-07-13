/// Represents the current physical state of a character in Nexus Clash.
/// 
/// This state machine serves as the foundation for animations, 
/// combat logic, AI decision-making, and multiplayer synchronization.
enum CharacterState {
  /// Standing still on the ground.
  idle,

  /// Moving horizontally along the ground.
  run,

  /// Moving upward in the air.
  jump,

  /// Moving downward in the air.
  fall,

  /// The moment of impact when hitting the ground.
  land,
}
