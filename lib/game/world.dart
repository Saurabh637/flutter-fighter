import 'package:flame/components.dart';
import '../components/environment/ground.dart';

/// The game world class that manages environmental components.
///
/// This class acts as a container for all game world elements,
/// such as the ground, platforms, and background layers.
class FighterWorld extends Component with HasGameRef {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Add the ground component to the world foundation.
    // Since this is added to FighterWorld, and FighterWorld is added to the game,
    // it will be rendered in the game's coordinate space.
    add(Ground());
  }
}
