import 'package:flame/components.dart';
import '../../managers/input_manager.dart';
import '../../components/ui/controls/movement_button.dart';
import '../../components/ui/controls/action_button.dart';

/// A component that initializes and manages touch controls for mobile devices.
///
/// This component populates the HUD with [MovementButton]s and [ActionButton]s
/// that update the provided [InputManager].
class TouchInput extends Component with HasGameReference {
  final InputManager inputManager;

  late final MovementButton _leftButton;
  late final MovementButton _rightButton;
  late final ActionButton _jumpButton;

  TouchInput(this.inputManager);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    const double buttonRadius = 40.0;

    _leftButton = MovementButton(
      inputManager: inputManager,
      isLeft: true,
      radius: buttonRadius,
      position: Vector2.zero(),
    );

    _rightButton = MovementButton(
      inputManager: inputManager,
      isLeft: false,
      radius: buttonRadius,
      position: Vector2.zero(),
    );

    _jumpButton = ActionButton(
      inputManager: inputManager,
      actionName: 'jump',
      radius: buttonRadius,
      position: Vector2.zero(),
    );

    add(_leftButton);
    add(_rightButton);
    add(_jumpButton);

    _repositionButtons(game.size);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    if (isLoaded) {
      _repositionButtons(size);
    }
  }

  void _repositionButtons(Vector2 screenSize) {
    const double buttonRadius = 40.0;
    const double margin = 60.0;

    _leftButton.position = Vector2(margin, screenSize.y - margin);
    _rightButton.position = Vector2(margin + (buttonRadius * 2.5), screenSize.y - margin);
    _jumpButton.position = Vector2(screenSize.x - margin, screenSize.y - margin);
  }
}
