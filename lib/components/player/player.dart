import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../environment/ground.dart';

/// A component representing the player character.
///
/// Implements [KeyboardHandler] to handle left/right movement.
class Player extends RectangleComponent with HasGameRef, KeyboardHandler {
  /// The fixed size of the player character.
  static final Vector2 playerSize = Vector2(50, 100);

  /// Horizontal movement speed in pixels per second.
  static const double _moveSpeed = 300.0;

  /// The current horizontal direction ( -1 for left, 1 for right, 0 for none).
  int _horizontalDirection = 0;

  /// The vertical velocity of the player (pixels per second).
  double _verticalVelocity = 0.0;

  /// The gravity constant (acceleration in pixels per second squared).
  static const double _gravity = 800.0;

  /// The upward force applied when the player jumps.
  static const double _jumpForce = -450.0;

  /// Whether the player is currently standing on the ground.
  bool _isGrounded = false;

  Player()
      : super(
          size: playerSize,
          paint: Paint()..color = const Color(0xFF2196F3), // Blue color
          anchor: Anchor.bottomCenter, // Anchor to bottom for easy floor placement
        );

  @override
  void update(double dt) {
    super.update(dt);

    // --- Horizontal Movement ---
    // Apply horizontal velocity based on direction and speed.
    position.x += _horizontalDirection * _moveSpeed * dt;

    // Keep the player within the visible screen bounds (X axis).
    // Half width is used because the anchor is bottomCenter.
    final halfWidth = size.x / 2;
    if (position.x < halfWidth) {
      position.x = halfWidth;
    } else if (position.x > gameRef.size.x - halfWidth) {
      position.x = gameRef.size.x - halfWidth;
    }

    // --- Vertical Movement (Gravity & Collision) ---
    _verticalVelocity += _gravity * dt;
    position.y += _verticalVelocity * dt;

    final groundY = gameRef.size.y - Ground.groundHeight;
    if (position.y >= groundY) {
      position.y = groundY;
      _verticalVelocity = 0.0;
      _isGrounded = true;
    } else {
      _isGrounded = false;
    }
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // Determine horizontal direction based on key presses.
    final isLeftPressed = keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightPressed = keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);

    if (isLeftPressed && isRightPressed) {
      _horizontalDirection = 0;
    } else if (isLeftPressed) {
      _horizontalDirection = -1;
    } else if (isRightPressed) {
      _horizontalDirection = 1;
    } else {
      _horizontalDirection = 0;
    }

    // --- Jump Logic ---
    // Trigger jump if Space is pressed AND the player is on the ground.
    // KeyDownEvent ensures the jump triggers once per press.
    if (event is KeyDownEvent &&
        keysPressed.contains(LogicalKeyboardKey.space) &&
        _isGrounded) {
      _verticalVelocity = _jumpForce;
      _isGrounded = false;
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // The player's initial position is handled by the World during initialization
    // to ensure they are spawned correctly relative to the environment.
  }
}
