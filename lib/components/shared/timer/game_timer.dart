import 'package:flame/components.dart';

/// A wrapper around Flame's Timer for general purpose timing.
class GameTimer extends Component {
  final Timer _timer;

  GameTimer(double limit, {bool repeat = false, VoidCallback? onTick})
      : _timer = Timer(limit, repeat: repeat, onTick: onTick);

  @override
  void update(double dt) {
    _timer.update(dt);
  }
}
