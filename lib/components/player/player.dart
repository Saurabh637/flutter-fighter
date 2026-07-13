import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import '../character/character.dart';
import '../character/character_config.dart';
import '../character/direction.dart';

/// A component representing the player character controlled by the user.
///
/// Inherits physics and movement logic from [Character] and handles
/// user keyboard input.
class Player extends Character with KeyboardHandler {
  Player()
      : super(
          size: CharacterConfig.defaultSize,
          color: const Color(0xFF2196F3), // Blue color
          moveSpeed: CharacterConfig.defaultMoveSpeed,
          jumpForce: CharacterConfig.defaultJumpForce,
        );

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // Determine horizontal direction based on key presses.
    final isLeftPressed = keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightPressed = keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);

    if (isLeftPressed && isRightPressed) {
      currentDirection = CharacterDirection.none;
    } else if (isLeftPressed) {
      currentDirection = CharacterDirection.left;
    } else if (isRightPressed) {
      currentDirection = CharacterDirection.right;
    } else {
      currentDirection = CharacterDirection.none;
    }

    // --- Jump Logic ---
    if (event is KeyDownEvent &&
        keysPressed.contains(LogicalKeyboardKey.space)) {
      jump();
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
