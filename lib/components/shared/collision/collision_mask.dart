import 'collision_layer.dart';

/// Handles bitmask calculations for complex collision filtering.
/// 
/// Allows for efficient checking of which [CollisionLayer]s should
/// interact with a given object.
class CollisionMask {
  final int value;

  const CollisionMask(this.value);

  /// Creates a mask that includes the given [layers].
  static CollisionMask fromLayers(List<CollisionLayer> layers) {
    // Future implementation of bitwise OR operations
    return const CollisionMask(0);
  }
}
