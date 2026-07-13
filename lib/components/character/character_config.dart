import 'package:flame/components.dart';

/// Configuration data for character physics, movement, and combat stats.
/// 
/// This class separates gameplay values from character logic, allowing
/// different characters (e.g., Light, Heavy, Boss) to be defined 
/// simply by providing a different configuration object.
class CharacterConfig {
  /// The name of the character.
  final String name;

  /// Default size for the character.
  final Vector2 size;

  /// Horizontal movement speed in pixels per second.
  final double moveSpeed;

  /// The upward force applied when the character jumps.
  final double jumpForce;

  /// The gravity constant applied to this specific character.
  final double gravity;

  /// Maximum health capacity.
  final double maxHealth;

  /// Maximum energy/mana capacity.
  final double maxEnergy;

  /// Damage dealt by a light attack.
  final double lightAttackDamage;

  /// Damage dealt by a heavy attack.
  final double heavyAttackDamage;

  /// The weight of the character (affects fall speed or knockback in the future).
  final double weight;

  /// Resistance to being pushed back by attacks (0.0 to 1.0).
  final double knockbackResistance;

  const CharacterConfig({
    required this.name,
    required this.size,
    this.moveSpeed = 300.0,
    this.jumpForce = -450.0,
    this.gravity = 800.0,
    this.maxHealth = 100.0,
    this.maxEnergy = 100.0,
    this.lightAttackDamage = 10.0,
    this.heavyAttackDamage = 25.0,
    this.weight = 1.0,
    this.knockbackResistance = 0.0,
  });

  /// Standard configuration for a balanced player character.
  static final CharacterConfig defaultPlayer = CharacterConfig(
    name: 'Player',
    size: Vector2(50, 100),
    moveSpeed: 300.0,
    jumpForce: -450.0,
    gravity: 800.0,
    maxHealth: 100.0,
    maxEnergy: 100.0,
  );

  /// Standard configuration for a basic enemy.
  static final CharacterConfig defaultEnemy = CharacterConfig(
    name: 'Enemy',
    size: Vector2(50, 100),
    moveSpeed: 200.0,
    jumpForce: -400.0,
    gravity: 800.0,
    maxHealth: 50.0,
    maxEnergy: 0.0,
  );
}
