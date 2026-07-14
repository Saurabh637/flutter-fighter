import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'package:flutter_fighter/components/shared/physics/physics_constants.dart';

/// A static ground component.
class Ground extends RectangleComponent {
  /// The total width of the stage.
  static const double groundWidth = 3000.0; // Made it a bit longer
  static const double groundHeight = 200.0;

  Ground() : super(
    size: Vector2(groundWidth, groundHeight),
    paint: Paint()..color = const Color(0xFF3E2723),
    // Place at the very bottom of the world
    position: Vector2(0, PhysicsConstants.worldHeight - groundHeight),
  );
}
