import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fighter/game/fighter_game.dart';
import 'package:flutter_fighter/components/player/player.dart';
import 'package:flutter_fighter/components/ui/mobile_controls_ui.dart';
import 'package:flutter_fighter/managers/input_manager.dart';

/// The entry point of the application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final game = FighterGame();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // The underlying game engine
            GameWidget(
              game: game,
              loadingBuilder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            
            // The professional Mobile UI Overlay
            FutureBuilder(
              future: game.loaded,
              builder: (context, snapshot) {
                // Once the game is loaded, we can safely access the player's input manager.
                // We use a fallback during loading to keep the UI structure stable.
                final inputManager = game.inputManager ?? InputManager();
                return MobileControlsUI(
                  inputManager: inputManager,
                );
              }
            ),
          ],
        ),
      ),
    ),
  );
}
