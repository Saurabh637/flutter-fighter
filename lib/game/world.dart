import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fighter/components/environment/ground.dart';
import 'package:flutter_fighter/components/player/player.dart';
import 'package:flutter_fighter/game/fighter_game.dart';

class FighterWorld extends World with HasGameReference<FighterGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 1. Add background pillars
    for (var i = 0; i < Ground.groundWidth; i += 400) {
      add(RectangleComponent(
        position: Vector2(i.toDouble(), 0),
        size: Vector2(50, 1000),
        paint: Paint()..color = Colors.white.withOpacity(0.05),
      ));
    }

    // 2. Add the ground
    add(Ground());

    // 3. Add the player
    final player = Player(inputManager: game.inputManager);
    player.position = Vector2(1500, 800); 
    add(player);

    // 4. Start Camera Follow
    game.cameraManager.follow(player);
  }
}
