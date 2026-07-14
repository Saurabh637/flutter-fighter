/// Defines physical properties for different surfaces and objects.
/// 
/// Used to calculate friction, bounciness, and impact sounds.
class PhysicsMaterial {
  final double friction;
  final double restitution;

  const PhysicsMaterial({
    this.friction = 0.5,
    this.restitution = 0.0,
  });

  static const PhysicsMaterial concrete = PhysicsMaterial(friction: 0.8);
  static const PhysicsMaterial ice = PhysicsMaterial(friction: 0.05);
}
