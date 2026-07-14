/// Generates unique identifiers for entities and network objects.
class IdGenerator {
  static int _current = 0;

  /// Returns a new unique integer ID.
  static int next() => ++_current;
}
