import 'package:flame/components.dart';

/// Configuration data for character physics and movement.
class CharacterConfig {
  final String name;
  final Vector2 size;
  final double moveSpeed;
  final double jumpForce;
  final double gravity;
  final double maxHealth;

  const CharacterConfig({
    required this.name,
    required this.size,
    this.moveSpeed = 400.0,
    this.jumpForce = -600.0,
    this.gravity = 1200.0,
    this.maxHealth = 100.0,
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
