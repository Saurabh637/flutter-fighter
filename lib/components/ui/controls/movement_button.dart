import 'package:flutter/material.dart';
import '../../../managers/input_manager.dart';
import 'touch_button.dart';

/// A specialized [TouchButton] for handling horizontal movement.
class MovementButton extends TouchButton {
  final InputManager inputManager;
  final bool isLeft;

  MovementButton({
    required this.inputManager,
    required this.isLeft,
    required super.radius,
    required super.position,
    Color color = Colors.grey,
  }) : super(
          baseColor: color,
          activeColor: Colors.white,
          onPressed: () {
            if (isLeft) {
              inputManager.moveLeft = true;
            } else {
              inputManager.moveRight = true;
            }
          },
          onReleased: () {
            if (isLeft) {
              inputManager.moveLeft = false;
            } else {
              inputManager.moveRight = false;
            }
          },
        );
}
