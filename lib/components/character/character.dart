import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fighter/components/environment/ground.dart';
import 'package:flutter_fighter/components/combat/health/health_component.dart';
import 'package:flutter_fighter/components/combat/damage/damage_component.dart';
import 'direction.dart';
import 'character_state.dart';
import 'character_config.dart';

/// Base class for all characters with physics and world boundaries.
abstract class Character extends RectangleComponent with HasGameReference {
  final CharacterConfig config;
  late final HealthComponent health;
  late final DamageComponent damageProcessor;
  
  CharacterDirection currentDirection = CharacterDirection.none;
  CharacterState currentState = CharacterState.idle;
  double verticalVelocity = 0.0;
  bool isGrounded = false;

  Character({
    required this.config,
    required Color color,
    Vector2? position,
    Anchor anchor = Anchor.bottomCenter,
  }) : super(
          size: config.size,
          position: position,
          paint: Paint()..color = color,
          anchor: anchor,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    health = HealthComponent(maxHealth: config.maxHealth);
    add(health);

    damageProcessor = DamageComponent(health: health);
    add(damageProcessor);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // --- Horizontal Movement ---
    double dir = 0;
    if (currentDirection == CharacterDirection.left) dir = -1;
    if (currentDirection == CharacterDirection.right) dir = 1;
    position.x += dir * config.moveSpeed * dt;

    // --- Clamp to World Width (0 to 3000) ---
    final halfWidth = size.x / 2;
    position.x = position.x.clamp(halfWidth, Ground.groundWidth - halfWidth);

    // --- Gravity and Vertical Movement ---
    verticalVelocity += config.gravity * dt;
    position.y += verticalVelocity * dt;

    // --- Ground Collision (Ground is at Y=800 in a 1000px high world) ---
    const double groundTop = 1000.0 - Ground.groundHeight;
    if (position.y >= groundTop) {
      position.y = groundTop;
      verticalVelocity = 0;
      isGrounded = true;
    } else {
      isGrounded = false;
    }

    _updateState();
  }

  void _updateState() {
    if (!isGrounded) {
      currentState = verticalVelocity < 0 ? CharacterState.jump : CharacterState.fall;
    } else {
      currentState = currentDirection != CharacterDirection.none ? CharacterState.run : CharacterState.idle;
    }
  }

  void jump() {
    if (isGrounded) {
      verticalVelocity = config.jumpForce;
      isGrounded = false;
    }
  }
}
