import 'package:flutter/material.dart';

/// Standardized text styles for the application.
class AppTextStyles {
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  // Prevent instantiation
  AppTextStyles._();
}
