import 'package:flame/components.dart';

/// Configuration data for character physics and movement.
class CharacterConfig {
  final String name;
  final Vector2 size;
  final double moveSpeed;
  final double jumpForce;
  final double gravity;

  const CharacterConfig({
    required this.name,
    required this.size,
    this.moveSpeed = 400.0,    // Increased speed
    this.jumpForce = -600.0,   // Increased jump height
    this.gravity = 1200.0,     // Increased gravity for snappier feel
  });

  static final CharacterConfig defaultPlayer = CharacterConfig(
    name: 'Player',
    size: Vector2(50, 100),
  );

  static final CharacterConfig defaultEnemy = CharacterConfig(
    name: 'Enemy',
    size: Vector2(50, 100),
    moveSpeed: 250.0,
  );
}
