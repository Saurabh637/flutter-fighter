import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game/fighter_game.dart';

/// The entry point of the application.
///
/// This file handles the initial startup sequence of the Flutter application
/// and boots the Flame game engine.
Future<void> main() async {
  // 1. Ensure Flutter framework is fully initialized.
  // This is required for interacting with the engine (e.g., locking orientation,
  // initializing services) before runApp is called.
  WidgetsFlutterBinding.ensureInitialized();

  // 2. [Milestone Placeholder] Service Initialization
  // This is where future services like Firebase, Shared Preferences,
  // and Dependency Injection (e.g., Riverpod/GetIt) will be initialized.
  // await initializationService.init();

  // 3. Instantiate the core game class.
  // Keeping this outside of the build tree ensures the game state is
  // preserved during hot reloads.
  final game = FighterGame();

  // 4. Launch the application.
  // We use Flame's GameWidget to bridge the Flutter widget tree with the Flame game loop.
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GameWidget(
          game: game,
          // Placeholder for a loading screen while the game loads its assets.
          loadingBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          // Placeholder for handling errors during the game loop.
          errorBuilder: (context, error) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    ),
  );
}
