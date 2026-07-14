import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fighter/components/player/player.dart';
import 'package:flutter_fighter/managers/input_manager.dart';
import 'package:flutter_fighter/managers/camera_manager.dart';
import 'package:flutter_fighter/components/environment/ground.dart';
import 'world.dart';

class FighterGame extends FlameGame with HasKeyboardHandlerComponents {
  final InputManager inputManager = InputManager();
  final FighterWorld fighterWorld = FighterWorld();
  late final CameraManager cameraManager;

  @override
  Color backgroundColor() => const Color(0xFF81D4FA);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Link the world to the camera
    world = fighterWorld;
    cameraManager = CameraManager(camera);
    
    // Add the world to the game
    add(fighterWorld);

    // Set camera boundaries for the 3000px wide world
    cameraManager.setBounds(const Rect.fromLTWH(0, 0, Ground.groundWidth, 1000));
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Apply the custom camera follow logic (Horizontal follow + Vertical lock)
    cameraManager.update(dt);
  }
}
