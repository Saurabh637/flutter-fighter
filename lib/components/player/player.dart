import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import '../../managers/input_manager.dart';
import '../../services/input/keyboard_input.dart';
import '../character/character.dart';
import '../character/character_config.dart';
import '../character/direction.dart';

/// A component representing the player character controlled by the user.
///
/// This component bridges the [InputManager] with the [Character] gameplay logic.
/// It uses [KeyboardInput] to capture physical events and translate them into
/// high-level actions.
class Player extends Character with KeyboardHandler {
  /// The single source of truth for all intended player actions.
  final InputManager _inputManager = InputManager();

  /// The service that handles physical keyboard mapping.
  late final KeyboardInput _keyboardInput;

  Player()
      : super(
          config: CharacterConfig.defaultPlayer,
          color: const Color(0xFF2196F3), // Blue color
        ) {
    _keyboardInput = KeyboardInput(_inputManager);
  }

  @override
  void update(double dt) {
    // 1. Synchronize character movement direction with input intent.
    _updateMovementDirection();

    // 2. Handle one-shot actions like Jumping.
    if (_inputManager.jump) {
      jump();
    }

    // 3. Process physics and movement in the base Character class.
    super.update(dt);

    // 4. Reset transient states (like jump) so they don't trigger again next frame.
    _inputManager.resetTransientStates();
  }

  /// Translates [InputManager] movement states into [CharacterDirection].
  void _updateMovementDirection() {
    if (_inputManager.moveLeft && _inputManager.moveRight) {
      currentDirection = CharacterDirection.none;
    } else if (_inputManager.moveLeft) {
      currentDirection = CharacterDirection.left;
    } else if (_inputManager.moveRight) {
      currentDirection = CharacterDirection.right;
    } else {
      currentDirection = CharacterDirection.none;
    }
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // Delegate physical key handling to the specialized keyboard service.
    return _keyboardInput.onKeyEvent(event, keysPressed);
  }
}
