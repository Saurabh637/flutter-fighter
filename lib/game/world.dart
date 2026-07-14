import 'package:flame/components.dart';
import 'package:flutter_fighter/components/environment/ground.dart';
import 'package:flutter_fighter/components/player/player.dart';

/// The game world class that manages environmental and entity components.
///
/// This class acts as a container for all game world elements,
/// such as the ground, platforms, and the player character.
class FighterWorld extends Component with HasGameReference {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 1. Add the ground component to the world foundation.
    final ground = Ground();
    add(ground);

    // 2. Add the player component.
    final player = Player();

    // Calculate position: Center X, and Y is 300 pixels above the ground.
    // This allows us to see the gravity in action as the player falls.
    player.position = Vector2(
      game.size.x / 2,
      game.size.y - Ground.groundHeight - 300,
    );

    add(player);
  }
}
