import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'world.dart';

/// The core game class for Flutter Fighter.
///
/// This class handles the game loop, component management,
/// and high-level game state.
/// [HasKeyboardHandlerComponents] is added to support keyboard input
/// within child components.
class FighterGame extends FlameGame with HasKeyboardHandlerComponents {
  /// The world foundation containing environmental components.
  late final FighterWorld fighterWorld;

  @override
  Color backgroundColor() => const Color(0xFF81D4FA); // Light blue sky color

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 1. Initialize the world foundation.
    // We add it directly to the game to use screen-space coordinates for this milestone.
    fighterWorld = FighterWorld();
    add(fighterWorld);

    // Preparation for future milestones:
    // - Camera setup
    // - Player initialization
    // - Collision detection setup
  }
}
