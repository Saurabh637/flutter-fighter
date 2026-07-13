import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../environment/ground.dart';
import 'direction.dart';
import 'character_state.dart';
import 'character_config.dart';

/// A base class for all characters in Nexus Clash (Player, Enemy).
///
/// This class handles shared physics, movement, and collision logic.
abstract class Character extends RectangleComponent with HasGameReference {
  /// Horizontal movement speed in pixels per second.
  final double moveSpeed;

  /// The upward force applied when the character jumps.
  final double jumpForce;

  /// The current horizontal direction.
  CharacterDirection currentDirection = CharacterDirection.none;

  /// The current state of the character.
  CharacterState currentState = CharacterState.idle;

  /// The vertical velocity of the character (pixels per second).
  double verticalVelocity = 0.0;

  /// Whether the character is currently standing on the ground.
  bool isGrounded = false;

  Character({
    required Vector2 size,
    required Color color,
    required this.moveSpeed,
    required this.jumpForce,
    Anchor anchor = Anchor.bottomCenter,
  }) : super(
          size: size,
          paint: Paint()..color = color,
          anchor: anchor,
        );

  @override
  void update(double dt) {
    super.update(dt);

    // Update state based on movement
    _updateState();

    // --- Horizontal Movement ---
    applyHorizontalMovement(dt);

    // --- Vertical Movement (Gravity & Collision) ---
    applyGravityAndCollision(dt);
  }

  /// Determines the character's state based on velocity and grounding.
  void _updateState() {
    if (!isGrounded) {
      if (verticalVelocity < 0) {
        currentState = CharacterState.jumping;
      } else {
        currentState = CharacterState.falling;
      }
    } else if (currentDirection != CharacterDirection.none) {
      currentState = CharacterState.walking;
    } else {
      currentState = CharacterState.idle;
    }
  }

  /// Applies horizontal movement based on [currentDirection] and [moveSpeed].
  void applyHorizontalMovement(double dt) {
    double dirMultiplier = 0;
    if (currentDirection == CharacterDirection.left) dirMultiplier = -1;
    if (currentDirection == CharacterDirection.right) dirMultiplier = 1;

    position.x += dirMultiplier * moveSpeed * dt;

    // Keep the character within the visible screen bounds (X axis).
    final halfWidth = size.x / 2;
    if (position.x < halfWidth) {
      position.x = halfWidth;
    } else if (position.x > game.size.x - halfWidth) {
      position.x = game.size.x - halfWidth;
    }
  }

  /// Applies gravity and handles ground collision.
  void applyGravityAndCollision(double dt) {
    verticalVelocity += CharacterConfig.gravity * dt;
    position.y += verticalVelocity * dt;

    final groundY = game.size.y - Ground.groundHeight;
    if (position.y >= groundY) {
      position.y = groundY;
      verticalVelocity = 0.0;
      isGrounded = true;
    } else {
      isGrounded = false;
    }
  }

  /// Triggers a jump if the character is grounded.
  void jump() {
    if (isGrounded) {
      verticalVelocity = jumpForce;
      isGrounded = false;
    }
  }
}
