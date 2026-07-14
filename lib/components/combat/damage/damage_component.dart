import 'package:flame/components.dart';
import 'package:flutter_fighter/components/combat/health/health_component.dart';

/// A component that processes incoming damage for a character.
/// 
/// It acts as a bridge between collision events (Hurtboxes) and 
/// the [HealthComponent], allowing for damage validation and 
/// modifications.
class DamageComponent extends Component {
  final HealthComponent health;

  DamageComponent({required this.health});

  /// Processes an incoming attack with the given [damage].
  /// 
  /// This method can be expanded to include armor calculations,
  /// invulnerability frames, or elemental resistances.
  void handleDamage(double damage) {
    if (damage <= 0) return;
    
    health.takeDamage(damage);
  }
}
