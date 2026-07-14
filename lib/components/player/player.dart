import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fighter/managers/input_manager.dart';
import 'package:flutter_fighter/services/input/keyboard_input.dart';
import 'package:flutter_fighter/components/character/character.dart';
import 'package:flutter_fighter/components/character/character_config.dart';
import 'package:flutter_fighter/components/character/direction.dart';
import 'package:flutter_fighter/components/combat/attack/hitbox.dart' as combat;

class Player extends Character with KeyboardHandler {
  final InputManager inputManager;
  late final KeyboardInput _keyboardInput;

  Player({required this.inputManager})
      : super(
          config: CharacterConfig.defaultPlayer,
          color: const Color(0xFF2196F3),
        ) {
    _keyboardInput = KeyboardInput(this.inputManager);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Add a hitbox that represents the player's attack reach.
    // For now, it's a simple area attached to the player.
    add(
      combat.Hitbox(
        size: Vector2(size.x * 1.5, size.y),
        owner: this,
        // Centered horizontally relative to the player (bottom-center anchor)
        position: Vector2(-size.x * 0.25, 0), 
      ),
    );
  }

  @override
  void update(double dt) {
    // Sync input to character direction
    if (inputManager.moveLeft && !inputManager.moveRight) {
      currentDirection = CharacterDirection.left;
    } else if (inputManager.moveRight && !inputManager.moveLeft) {
      currentDirection = CharacterDirection.right;
    } else {
      currentDirection = CharacterDirection.none;
    }

    // Handle Jump
    if (inputManager.jump) {
      jump();
      inputManager.jump = false; // Reset immediately after triggering
    }

    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    return _keyboardInput.onKeyEvent(event, keysPressed);
  }
}
