import 'package:flame/components.dart';
import '../components/environment/ground.dart';
import '../components/player/player.dart';

/// The game world class that manages environmental and entity components.
///
/// This class acts as a container for all game world elements,
/// such as the ground, platforms, and the player character.
class FighterWorld extends Component with HasGameRef {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 1. Add the ground component to the world foundation.
    final ground = Ground();
    add(ground);

    // 2. Add the player component.
    // We position the player horizontally centered and vertically just above the ground.
    final player = Player();

    // Calculate position: Center X, and Y is at the top of the ground.
    // Since Player anchor is bottomCenter, position.y = ground's top.
    player.position = Vector2(
      gameRef.size.x / 2,
      gameRef.size.y - Ground.groundHeight,
    );

    add(player);
  }
}
