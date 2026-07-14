/// Base class for health-related events.
abstract class HealthEvent {}

/// Event triggered when damage is taken.
class DamageTakenEvent extends HealthEvent {
  final double amount;
  DamageTakenEvent(this.amount);
}

/// Event triggered when healing occurs.
class HealedEvent extends HealthEvent {
  final double amount;
  HealedEvent(this.amount);
}
