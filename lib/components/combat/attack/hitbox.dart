import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_fighter/components/character/character.dart';
import 'package:flutter_fighter/components/combat/attack/hurtbox.dart';

/// A component that defines an active attack area.
/// 
/// Stores the [owner] who initiated the attack and the [damage] 
/// it deals. It detects overlaps with [Hurtbox] components 
/// to trigger damage processing.
class Hitbox extends PositionComponent with CollisionCallbacks {
  final Character owner;
  final double damage;

  Hitbox({
    required Vector2 size,
    required this.owner,
    this.damage = 10.0,
    Vector2? position,
  }) : super(size: size, position: position);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Add a Flame Hitbox for collision detection
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Hurtbox) {
      // Forward damage to the damage component of the character hit
      other.damageComponent.handleDamage(damage);
    }
  }
}
