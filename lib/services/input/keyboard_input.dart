import 'package:flutter/services.dart';
import '../../managers/input_manager.dart';

/// A specialized adapter that translates physical keyboard events into
/// high-level game actions managed by an [InputManager].
///
/// This adapter ensures that gameplay logic remains unaware of specific
/// hardware keys, facilitating cross-platform support and remapping.
class KeyboardInput {
  /// The [InputManager] instance this adapter will update.
  final InputManager inputManager;

  /// Creates a [KeyboardInput] adapter for the given [inputManager].
  KeyboardInput(this.inputManager);

  /// Processes raw keyboard events and updates the associated [InputManager].
  ///
  /// Maps physical keys to high-level actions:
  /// - [LogicalKeyboardKey.keyA] / [LogicalKeyboardKey.arrowLeft] -> Move Left
  /// - [LogicalKeyboardKey.keyD] / [LogicalKeyboardKey.arrowRight] -> Move Right
  /// - [LogicalKeyboardKey.space] -> Jump
  /// - [LogicalKeyboardKey.keyJ] -> Light Attack
  /// - [LogicalKeyboardKey.keyK] -> Heavy Attack
  /// - [LogicalKeyboardKey.keyL] -> Special Attack
  /// - [LogicalKeyboardKey.escape] -> Pause
  ///
  /// This method returns `true` to indicate the event has been handled.
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // Horizontal Movement
    inputManager.moveLeft = keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    inputManager.moveRight = keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);

    // Jump (Triggered on key down to prevent repeated jumping if held)
    if (event is KeyDownEvent && keysPressed.contains(LogicalKeyboardKey.space)) {
      inputManager.jump = true;
    }

    // Future Combat and System Actions
    inputManager.lightAttack = keysPressed.contains(LogicalKeyboardKey.keyJ);
    inputManager.heavyAttack = keysPressed.contains(LogicalKeyboardKey.keyK);
    inputManager.specialAttack = keysPressed.contains(LogicalKeyboardKey.keyL);
    inputManager.pause = keysPressed.contains(LogicalKeyboardKey.escape);

    return true;
  }
}
