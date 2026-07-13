import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// A simple ground component representing the floor of the game world.
///
/// This component provides a visual floor and serves as the foundation
/// for future collision detection milestones.
class Ground extends RectangleComponent with HasGameRef {
  /// The fixed height of the ground platform.
  static const double groundHeight = 100.0;

  Ground() : super(
    // Initialize with a default size to avoid zero-height issues
    size: Vector2(0, groundHeight),
    paint: Paint()..color = const Color(0xFF3E2723), // Dark brown
  );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Set initial width to match the game screen
    size.x = gameRef.size.x;
    // Position at the very bottom of the screen
    position = Vector2(0, gameRef.size.y - groundHeight);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    // Ensure the ground always spans the full width and stays at the bottom
    this.size.x = size.x;
    position.y = size.y - groundHeight;
  }
}
