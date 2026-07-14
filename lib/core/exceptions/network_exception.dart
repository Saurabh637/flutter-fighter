import 'app_exception.dart';

/// Exception thrown during network operations.
class NetworkException extends AppException {
  NetworkException(String message) : super(message, 'Network Error: ');
}
