import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../character/character.dart';
import '../character/character_config.dart';

/// A component representing an enemy character.
/// 
/// This is currently a placeholder that inherits from [Character]
/// and will be expanded with AI and combat logic in future milestones.
class Enemy extends Character {
  Enemy({
    Vector2? position,
  }) : super(
          config: CharacterConfig.defaultEnemy,
          color: const Color(0xFFF44336), // Red color for enemies
          position: position,
        );
}
