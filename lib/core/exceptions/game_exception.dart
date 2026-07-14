import 'app_exception.dart';

/// Exception thrown by game-engine related infrastructure.
class GameException extends AppException {
  GameException(String message) : super(message, 'Game Error: ');
}
