import 'environment.dart';

/// High-level application configuration.
class AppConfig {
  final Environment environment;
  final bool enableLogging;

  AppConfig({
    required this.environment,
    this.enableLogging = true,
  });
}
