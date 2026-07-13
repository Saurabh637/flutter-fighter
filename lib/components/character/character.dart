import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../environment/ground.dart';

/// A base class for all characters in Nexus Clash (Player, Enemies, NPCs).
///
/// This class handles shared physics, movement, and collision logic
/// to ensure consistency across all entities.
abstract class Character extends RectangleComponent with HasGameReference {
  /// Horizontal movement speed in pixels per second.
  final double moveSpeed;

  /// The upward force applied when the character jumps.
  final double jumpForce;

  /// The current horizontal direction (-1 for left, 1 for right, 0 for none).
  int horizontalDirection = 0;

  /// The vertical velocity of the character (pixels per second).
  double verticalVelocity = 0.0;

  /// The gravity constant (acceleration in pixels per second squared).
  static const double gravity = 800.0;

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

    // --- Horizontal Movement ---
    applyHorizontalMovement(dt);

    // --- Vertical Movement (Gravity & Collision) ---
    applyGravityAndCollision(dt);
  }

  /// Applies horizontal movement based on [horizontalDirection] and [moveSpeed].
  void applyHorizontalMovement(double dt) {
    position.x += horizontalDirection * moveSpeed * dt;

    // Keep the character within the visible screen bounds (X axis).
    // Assumes Anchor.bottomCenter or Anchor.center for simplicity.
    final halfWidth = size.x / 2;
    if (position.x < halfWidth) {
      position.x = halfWidth;
    } else if (position.x > game.size.x - halfWidth) {
      position.x = game.size.x - halfWidth;
    }
  }

  /// Applies gravity to [verticalVelocity] and handles ground collision.
  void applyGravityAndCollision(double dt) {
    verticalVelocity += gravity * dt;
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

  /// Triggers a jump if the character is currently on the ground.
  void jump() {
    if (isGrounded) {
      verticalVelocity = jumpForce;
      isGrounded = false;
    }
  }
}
