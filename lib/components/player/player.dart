import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import '../../managers/input_manager.dart';
import '../../services/input/keyboard_input.dart';
import '../character/character.dart';
import '../character/character_config.dart';
import '../character/direction.dart';

/// A component representing the player character controlled by the user.
///
/// This component is decoupled from physical input devices. It reads intended
/// actions from an [InputManager] and executes them through the [Character] base.
class Player extends Character with KeyboardHandler {
  /// The single source of truth for all intended player actions.
  final InputManager _inputManager;

  /// The adapter that translates physical keyboard events.
  late final KeyboardInput _keyboardInput;

  Player({InputManager? inputManager})
      : _inputManager = inputManager ?? InputManager(),
        super(
          config: CharacterConfig.defaultPlayer,
          color: const Color(0xFF2196F3), // Blue color
        ) {
    _keyboardInput = KeyboardInput(_inputManager);
  }

  @override
  void update(double dt) {
    // 1. Process movement based on the InputManager state.
    _handleInput();

    // 2. Perform base character updates (physics, gravity, collision).
    super.update(dt);

    // 3. Clear transient input flags (like jump) after they have been processed.
    _inputManager.resetTransientStates();
  }

  /// Reads current actions from the [InputManager] and updates the character state.
  void _handleInput() {
    // Sync horizontal direction.
    if (_inputManager.moveLeft && _inputManager.moveRight) {
      currentDirection = CharacterDirection.none;
    } else if (_inputManager.moveLeft) {
      currentDirection = CharacterDirection.left;
    } else if (_inputManager.moveRight) {
      currentDirection = CharacterDirection.right;
    } else {
      currentDirection = CharacterDirection.none;
    }

    // Trigger jump if intended.
    if (_inputManager.jump) {
      jump();
    }
    
    // Future: Handle lightAttack, heavyAttack, etc. from _inputManager here.
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // Delegate key events to the specialized Keyboard Input Adapter.
    return _keyboardInput.onKeyEvent(event, keysPressed);
  }
}
