import 'package:flame/components.dart';

/// Data class defining knockback parameters.
class KnockbackData {
  final Vector2 direction;
  final double force;
  final double duration;

  const KnockbackData({
    required this.direction,
    required this.force,
    this.duration = 0.2,
  });
}
