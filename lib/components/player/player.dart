import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import '../character/character.dart';

/// A component representing the player character controlled by the user.
///
/// Inherits physics and movement logic from [Character] and handles
/// user keyboard input.
class Player extends Character with KeyboardHandler {
  /// The fixed size of the player character.
  static final Vector2 playerSize = Vector2(50, 100);

  /// Default movement settings for the player.
  static const double _defaultMoveSpeed = 300.0;
  static const double _defaultJumpForce = -450.0;

  Player()
      : super(
          size: playerSize,
          color: const Color(0xFF2196F3), // Blue color
          moveSpeed: _defaultMoveSpeed,
          jumpForce: _defaultJumpForce,
        );

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // Determine horizontal direction based on key presses.
    final isLeftPressed = keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightPressed = keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);

    if (isLeftPressed && isRightPressed) {
      horizontalDirection = 0;
    } else if (isLeftPressed) {
      horizontalDirection = -1;
    } else if (isRightPressed) {
      horizontalDirection = 1;
    } else {
      horizontalDirection = 0;
    }

    // --- Jump Logic ---
    // Trigger jump if Space is pressed.
    // KeyDownEvent ensures the jump triggers once per press.
    if (event is KeyDownEvent &&
        keysPressed.contains(LogicalKeyboardKey.space)) {
      jump();
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Additional player-specific initialization can go here.
  }
}
