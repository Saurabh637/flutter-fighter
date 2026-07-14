import 'dart:developer' as dev;

/// Centralized logging system for development and debugging.
class GameLogger {
  /// Logs an info message.
  static void info(String message) {
    dev.log('[INFO] $message');
  }

  /// Logs an error message.
  static void error(String message) {
    dev.log('[ERROR] $message');
  }
}
