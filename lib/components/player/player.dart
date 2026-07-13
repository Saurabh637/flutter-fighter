import 'package:flame/components.dart';
import 'package:flutter/material.dart';

/// A component representing the player character.
///
/// At this stage, the Player is a simple visual placeholder (a blue rectangle)
/// and does not yet contain any movement or physics logic.
class Player extends RectangleComponent with HasGameRef {
  /// The fixed size of the player character.
  static final Vector2 playerSize = Vector2(50, 100);

  Player()
      : super(
          size: playerSize,
          paint: Paint()..color = const Color(0xFF2196F3), // Blue color
          anchor: Anchor.bottomCenter, // Anchor to bottom for easy floor placement
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // The player's initial position is handled by the World during initialization
    // to ensure they are spawned correctly relative to the environment.
  }
}
