import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/rendering.dart';

/// A manager that controls the camera's behavior.
class CameraManager {
  final CameraComponent camera;
  PositionComponent? _target;

  CameraManager(this.camera);

  /// Sets the target for the camera to follow.
  void follow(PositionComponent target) {
    _target = target;
    
    // We anchor the camera to the bottom-center. 
    // This makes it easy to lock the bottom of the screen to the ground.
    camera.viewfinder.anchor = Anchor.bottomCenter;
  }

  /// Manually updates the camera position every frame.
  void update(double dt) {
    if (_target == null) return;

    // 1. Follow the player horizontally (X-axis).
    // 2. Lock the vertical position (Y-axis) to the bottom of the world (1000px).
    // This ensures the ground never moves when you jump and there is no blue gap.
    camera.viewfinder.position = Vector2(_target!.x, 1000);
  }

  /// Sets boundaries to prevent the camera from moving past the world edges.
  void setBounds(Rect worldBounds) {
    camera.setBounds(Rectangle.fromRect(worldBounds));
  }
}
