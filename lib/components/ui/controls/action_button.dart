import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import '../../../managers/input_manager.dart';
import 'touch_button.dart';

/// A specialized [TouchButton] for handling character actions like jumping or attacking.
class ActionButton extends TouchButton {
  final InputManager inputManager;
  final String actionName;

  ActionButton({
    required this.inputManager,
    required this.actionName,
    required super.radius,
    required super.position,
    Color color = Colors.blue,
  }) : super(
          baseColor: color,
          activeColor: Colors.white,
        );

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _updateActionState(true);
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    _updateActionState(false);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    super.onTapCancel(event);
    _updateActionState(false);
  }

  void _updateActionState(bool state) {
    switch (actionName) {
      case 'jump':
        if (state) inputManager.jump = true;
        break;
      case 'lightAttack':
        inputManager.lightAttack = state;
        break;
      case 'heavyAttack':
        inputManager.heavyAttack = state;
        break;
      case 'specialAttack':
        inputManager.specialAttack = state;
        break;
      case 'pause':
        inputManager.pause = state;
        break;
    }
  }
}
