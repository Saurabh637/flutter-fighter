import 'package:flutter/services.dart';
import '../../managers/input_manager.dart';

/// A service that maps physical keyboard keys to game actions in [InputManager].
///
/// This class handles low-level keyboard events and translates them into
/// high-level actions, decoupling input hardware from gameplay logic.
class KeyboardInput {
  final InputManager inputManager;

  KeyboardInput(this.inputManager);

  /// Processes keyboard events and updates the [inputManager] state.
  /// 
  /// Returns true to indicate the event was handled.
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // Horizontal Movement Mapping
    inputManager.moveLeft = keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    inputManager.moveRight = keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);

    // Jump Mapping (Space)
    // We check for KeyDownEvent to ensure the jump action is only triggered once.
    if (event is KeyDownEvent && keysPressed.contains(LogicalKeyboardKey.space)) {
      inputManager.jump = true;
    }

    // Action Mapping Placeholders
    inputManager.lightAttack = keysPressed.contains(LogicalKeyboardKey.keyJ);
    inputManager.heavyAttack = keysPressed.contains(LogicalKeyboardKey.keyK);
    inputManager.specialAttack = keysPressed.contains(LogicalKeyboardKey.keyL);
    inputManager.pause = keysPressed.contains(LogicalKeyboardKey.escape);

    return true;
  }
}
