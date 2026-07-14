/// Abstract definition for a service locator.
/// 
/// Prepared for integration with packages like GetIt or Provider.
abstract class ServiceLocator {
  void registerSingleton<T extends Object>(T instance);
  void registerLazySingleton<T extends Object>(T Function() factory);
  T get<T extends Object>();
}
