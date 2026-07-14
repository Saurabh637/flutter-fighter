/// Static build-time configuration.
class BuildConfig {
  static const bool isDebug = bool.fromEnvironment('DEBUG', defaultValue: true);
  static const String flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');

  // Prevent instantiation
  BuildConfig._();
}
