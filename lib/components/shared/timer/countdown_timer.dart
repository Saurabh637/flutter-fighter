/// Specialized timer for match countdowns and UI displays.
class CountdownTimer {
  final double duration;
  double _remaining;

  CountdownTimer(this.duration) : _remaining = duration;

  void update(double dt) {
    if (_remaining > 0) _remaining -= dt;
  }

  double get remaining => _remaining;
}
