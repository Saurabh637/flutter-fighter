import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

/// A base component for touch-based UI buttons in Nexus Clash.
///
/// Handles basic visual states and touch event callbacks.
/// This class is designed to be extended by specific buttons like [MovementButton].
class TouchButton extends CircleComponent with TapCallbacks {
  /// Callback triggered when the button is pressed down.
  final VoidCallback? onPressed;

  /// Callback triggered when the button is released.
  final VoidCallback? onReleased;

  /// The color of the button when it is not being touched.
  final Color baseColor;

  /// The color of the button when it is currently being touched.
  final Color activeColor;

  TouchButton({
    required double radius,
    required this.baseColor,
    required this.activeColor,
    this.onPressed,
    this.onReleased,
    super.position,
    super.anchor = Anchor.center,
  }) : super(radius: radius);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    paint = Paint()..color = baseColor.withOpacity(0.5);
  }

  @override
  void onTapDown(TapDownEvent event) {
    paint.color = activeColor.withOpacity(0.8);
    onPressed?.call();
  }

  @override
  void onTapUp(TapUpEvent event) {
    paint.color = baseColor.withOpacity(0.5);
    onReleased?.call();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    paint.color = baseColor.withOpacity(0.5);
    onReleased?.call();
  }
}
