import 'service_locator.dart';

/// Entry point for dependency injection configuration.
class Injector {
  static late final ServiceLocator _locator;

  /// Initializes the dependency injection system.
  static Future<void> init(ServiceLocator locator) async {
    _locator = locator;
    // Register global dependencies here
  }

  static T get<T extends Object>() => _locator.get<T>();

  // Prevent instantiation
  Injector._();
}
