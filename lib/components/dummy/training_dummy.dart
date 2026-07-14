import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fighter/components/character/character.dart';
import 'package:flutter_fighter/components/character/character_config.dart';
import 'package:flutter_fighter/components/combat/attack/hurtbox.dart';

/// A stationary target for combat testing.
/// 
/// Reuses the [Character] base class to ensure consistent physics
/// and collision behavior with other characters in the world.
class TrainingDummy extends Character {
  TrainingDummy({super.position})
      : super(
          config: CharacterConfig(
            name: 'Training Dummy',
            size: Vector2(50, 100),
            moveSpeed: 0.0,
          ),
          color: Colors.red,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Add a hurtbox that covers the dummy's entire body.
    add(
      Hurtbox(
        size: size,
        damageComponent: damageProcessor,
      ),
    );
  }
}
