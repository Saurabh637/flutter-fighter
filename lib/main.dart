import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fighter/game/fighter_game.dart';
import 'package:flutter_fighter/components/ui/mobile_controls_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final game = FighterGame();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // The Game Engine
            GameWidget(game: game),
            
            // The UI Overlay (Uses the shared InputManager from the game instance)
            MobileControlsUI(inputManager: game.inputManager),
          ],
        ),
      ),
    ),
  );
}
