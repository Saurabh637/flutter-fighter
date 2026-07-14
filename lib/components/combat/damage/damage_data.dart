import 'damage_type.dart';

/// Data class representing incoming damage information.
class DamageData {
  final double amount;
  final DamageType type;

  const DamageData({
    required this.amount,
    required this.type,
  });
}
