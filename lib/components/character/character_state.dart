/// Represents the current physical state of a character.
///
/// This will eventually be used to trigger different animations
/// and state-specific logic.
enum CharacterState {
  idle,
  walking,
  jumping,
  falling,
}
