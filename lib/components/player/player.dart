import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../environment/ground.dart';

/// A component representing the player character.
///
/// At this stage, the Player is a simple visual placeholder (a blue rectangle)
/// and does not yet contain any movement or physics logic.
class Player extends RectangleComponent with HasGameRef {
  /// The fixed size of the player character.
  static final Vector2 playerSize = Vector2(50, 100);

  /// The vertical velocity of the player (pixels per second).
  double _verticalVelocity = 0.0;

  /// The gravity constant (acceleration in pixels per second squared).
  /// This value determines how fast the player accelerates downward.
  static const double _gravity = 800.0;

  Player()
      : super(
          size: playerSize,
          paint: Paint()..color = const Color(0xFF2196F3), // Blue color
          anchor: Anchor.bottomCenter, // Anchor to bottom for easy floor placement
        );

  @override
  void update(double dt) {
    super.update(dt);

    // 1. Apply gravity to vertical velocity.
    _verticalVelocity += _gravity * dt;

    // 2. Apply vertical velocity to position.
    position.y += _verticalVelocity * dt;

    // 3. Ground Collision Detection.
    // Calculate the Y coordinate of the top of the ground.
    final groundY = gameRef.size.y - Ground.groundHeight;

    // Check if the player (anchored at bottomCenter) has passed the ground level.
    if (position.y >= groundY) {
      // Snap position to the ground level to prevent sinking.
      position.y = groundY;
      
      // Stop downward movement by resetting velocity.
      _verticalVelocity = 0.0;
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // The player's initial position is handled by the World during initialization
    // to ensure they are spawned correctly relative to the environment.
  }
}
