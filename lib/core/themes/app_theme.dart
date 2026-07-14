import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

/// Centralized application theme configuration.
class AppTheme {
  /// Returns the light theme for the application.
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        bodyLarge: AppTextStyles.bodyLarge,
        titleLarge: AppTextStyles.titleLarge,
      ),
    );
  }

  // Prevent instantiation
  AppTheme._();
}
