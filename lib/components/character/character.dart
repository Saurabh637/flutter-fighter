import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../environment/ground.dart';
import 'direction.dart';
import 'character_state.dart';
import 'character_config.dart';

/// A base class for all characters in Nexus Clash (Player, Enemy).
///
/// This class handles shared physics, movement, and collision logic.
/// It uses a [CharacterConfig] to define its specific gameplay attributes.
abstract class Character extends RectangleComponent with HasGameReference {
  /// The configuration object containing this character's statistics and physics values.
  final CharacterConfig config;

  /// The current horizontal direction.
  CharacterDirection currentDirection = CharacterDirection.none;

  /// The current state of the character.
  CharacterState currentState = CharacterState.idle;

  /// The vertical velocity of the character (pixels per second).
  double verticalVelocity = 0.0;

  /// Whether the character is currently standing on the ground.
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
  void update(double dt) {
    super.update(dt);

    // --- Horizontal Movement ---
    applyHorizontalMovement(dt);

    // --- Vertical Movement (Gravity & Collision) ---
    applyGravityAndCollision(dt);

    // Update state based on movement results from this frame
    _updateState();
  }

  /// Determines the character's state based on velocity and grounding.
  /// 
  /// This serves as the core state machine logic, automatically transitioning
  /// between Idle, Run, Jump, Fall, and Land.
  void _updateState() {
    // If airborne
    if (!isGrounded) {
      if (verticalVelocity < 0) {
        currentState = CharacterState.jump;
      } else {
        currentState = CharacterState.fall;
      }
    } 
    // If grounded
    else {
      // Check if we just landed this frame
      if (currentState == CharacterState.fall || currentState == CharacterState.jump) {
        currentState = CharacterState.land;
      } 
      // If we are already in land state, we stay there for one frame then transition
      // to idle or run. This allows animation systems to trigger landing effects.
      else if (currentState == CharacterState.land) {
        if (currentDirection != CharacterDirection.none) {
          currentState = CharacterState.run;
        } else {
          currentState = CharacterState.idle;
        }
      }
      // Standard grounded states
      else {
        if (currentDirection != CharacterDirection.none) {
          currentState = CharacterState.run;
        } else {
          currentState = CharacterState.idle;
        }
      }
    }
  }

  /// Applies horizontal movement based on [currentDirection] and [config.moveSpeed].
  void applyHorizontalMovement(double dt) {
    double dirMultiplier = 0;
    if (currentDirection == CharacterDirection.left) dirMultiplier = -1;
    if (currentDirection == CharacterDirection.right) dirMultiplier = 1;

    position.x += dirMultiplier * config.moveSpeed * dt;

    // Keep the character within the visible screen bounds (X axis).
    final halfWidth = size.x / 2;
    if (position.x < halfWidth) {
      position.x = halfWidth;
    } else if (position.x > game.size.x - halfWidth) {
      position.x = game.size.x - halfWidth;
    }
  }

  /// Applies gravity and handles ground collision using [config.gravity].
  void applyGravityAndCollision(double dt) {
    verticalVelocity += config.gravity * dt;
    position.y += verticalVelocity * dt;

    final groundY = game.size.y - Ground.groundHeight;
    if (position.y >= groundY) {
      position.y = groundY;
      verticalVelocity = 0.0;
      isGrounded = true;
    } else {
      isGrounded = false;
    }
  }

  /// Triggers a jump if the character is grounded using [config.jumpForce].
  void jump() {
    if (isGrounded) {
      verticalVelocity = config.jumpForce;
      isGrounded = false;
      currentState = CharacterState.jump;
    }
  }
}
