/// Abstract service for application-wide logging.
abstract class LoggerService {
  void info(String message);
  void warning(String message);
  void error(String message, [dynamic error, StackTrace? stackTrace]);
}
