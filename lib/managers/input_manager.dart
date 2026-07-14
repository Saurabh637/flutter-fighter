/// A platform-independent manager that stores the current state of game actions.
///
/// This serves as the single source of truth for character actions, allowing
/// different input methods (keyboard, touch, gamepad, network, AI) to 
/// update the same set of states without modifying gameplay logic.
class InputManager {
  /// Whether the player is intending to move left.
  bool moveLeft = false;

  /// Whether the player is intending to move right.
  bool moveRight = false;

  /// Whether the player just triggered a jump.
  bool jump = false;

  /// Whether the player is performing a light attack.
  bool lightAttack = false;

  /// Whether the player is performing a heavy attack.
  bool heavyAttack = false;

  /// Whether the player is performing a special attack.
  bool specialAttack = false;

  /// Whether the game is paused.
  bool pause = false;

  /// Resets transient states like 'jump' after they have been processed.
  void resetTransientStates() {
    jump = false;
    // Add other one-shot actions here (e.g., button clicks)
  }
}
