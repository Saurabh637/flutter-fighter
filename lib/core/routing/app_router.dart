import 'package:flutter/material.dart';
import 'route_names.dart';

/// Manages application-wide routing and navigation.
class AppRouter {
  /// Generates routes based on [RouteSettings].
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Home'))));
      case RouteNames.game:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Game'))));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  // Prevent instantiation
  AppRouter._();
}
