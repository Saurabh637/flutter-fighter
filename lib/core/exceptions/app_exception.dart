/// Base exception class for the application.
class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException(this.message, [this.prefix]);

  @override
  String toString() => '${prefix ?? ''}$message';
}
