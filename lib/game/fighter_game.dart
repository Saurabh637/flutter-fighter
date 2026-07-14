import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fighter/components/player/player.dart';
import 'package:flutter_fighter/managers/input_manager.dart';
import 'world.dart';

/// The core game class for Flutter Fighter.
///
/// This class handles the game loop, component management,
/// and high-level game state.
/// [HasKeyboardHandlerComponents] is added to support keyboard input
/// within child components.
class FighterGame extends FlameGame with HasKeyboardHandlerComponents {
  /// The world foundation containing environmental components.
  /// Initialized immediately to avoid LateInitializationError in the UI overlay.
  final FighterWorld fighterWorld = FighterWorld();

  /// Exposes the player's input manager to the UI overlay.
  InputManager? get inputManager => 
      fighterWorld.isLoaded ? fighterWorld.children.query<Player>().firstOrNull?.inputManager : null;

  @override
  Color backgroundColor() => const Color(0xFF81D4FA); // Light blue sky color

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Add the already initialized world foundation.
    add(fighterWorld);

    // Preparation for future milestones:
    // - Camera setup
    // - Player initialization
    // - Collision detection setup
  }
}
