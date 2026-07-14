/// Logic for handling attack or ability cooldowns.
class CooldownTimer {
  final double cooldown;
  double _timer = 0;

  CooldownTimer(this.cooldown);

  bool get isReady => _timer <= 0;

  void start() => _timer = cooldown;

  void update(double dt) {
    if (_timer > 0) _timer -= dt;
  }
}
