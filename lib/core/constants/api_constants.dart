/// Constants for backend API integration.
class ApiConstants {
  static const String baseUrl = 'https://api.nexusclash.com/v1';
  static const String springBootUrl = 'http://localhost:8080/api';
  
  // Endpoints
  static const String authEndpoint = '/auth';
  static const String combatEndpoint = '/combat';

  // Prevent instantiation
  ApiConstants._();
}
