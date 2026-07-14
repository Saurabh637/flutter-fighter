import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_fighter/components/combat/damage/damage_component.dart';

/// A component that defines a damageable area on a character.
/// 
/// When a [Hitbox] overlaps with this [Hurtbox], it notifies 
/// the associated [DamageComponent] to process the attack.
class Hurtbox extends PositionComponent with CollisionCallbacks {
  final DamageComponent damageComponent;

  Hurtbox({
    required Vector2 size,
    required this.damageComponent,
    Vector2? position,
  }) : super(size: size, position: position);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Add a Flame Hitbox for collision detection
    add(RectangleHitbox());
  }
}
