import 'package:flame/components.dart';
import '../components/environment/ground.dart';
import '../components/player/player.dart';
import '../services/input/touch_input.dart';

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
    player.position = Vector2(
      game.size.x / 2,
      game.size.y - Ground.groundHeight - 300,
    );

    add(player);

    // 3. Add the Touch Input layer.
    // This allows mobile users to control the character.
    add(TouchInput(player.inputManager));
  }
}
