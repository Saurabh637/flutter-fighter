import 'attack_type.dart';

/// Data class representing an attack's properties.
class AttackData {
  final double damage;
  final AttackType type;
  final double knockbackForce;

  const AttackData({
    required this.damage,
    required this.type,
    this.knockbackForce = 0.0,
  });
}
