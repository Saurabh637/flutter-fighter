import 'package:flame/components.dart';

/// A reusable component for managing character health.
/// 
/// Handles health status, damage, and healing logic independently
/// from the character's physical representation or behavior.
class HealthComponent extends Component {
  final double maxHealth;
  late double _currentHealth;

  /// Creates a [HealthComponent] with a specified [maxHealth].
  HealthComponent({required this.maxHealth}) {
    _currentHealth = maxHealth;
  }

  /// Returns the current health value.
  double get currentHealth => _currentHealth;

  /// Returns true if the health is greater than zero.
  bool get isAlive => _currentHealth > 0;

  /// Reduces health by the given [damage] amount.
  /// 
  /// Health will not drop below zero.
  void takeDamage(double damage) {
    _currentHealth = (_currentHealth - damage).clamp(0, maxHealth);
  }

  /// Increases health by the given [amount].
  /// 
  /// Health will not exceed [maxHealth].
  void heal(double amount) {
    if (!isAlive) return; // Cannot heal the dead
    _currentHealth = (_currentHealth + amount).clamp(0, maxHealth);
  }

  /// Resets health to [maxHealth].
  void reset() {
    _currentHealth = maxHealth;
  }
}
