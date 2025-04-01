import 'package:flutter/material.dart';
import 'colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.accentColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryColor),
      bodyMedium: TextStyle(color: AppColors.textSecondaryColor),
      displayLarge: TextStyle(
        color: AppColors.textPrimaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    ), colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.accentColor,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.textSecondaryColor,
      surface: AppColors.backgroundColor,
      onSurface: AppColors.textPrimaryColor,
      error: Colors.red,
      onError: Colors.white,
    ).copyWith(surface: AppColors.backgroundColor),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.accentColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryColor),
      bodyMedium: TextStyle(color: AppColors.textSecondaryColor),
      displayLarge: TextStyle(
        color: AppColors.textPrimaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    ), colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.accentColor,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.textSecondaryColor,
      surface: AppColors.primaryColor,
      onSurface: AppColors.textPrimaryColor,
      error: Colors.red,
      onError: Colors.white,
    ).copyWith(surface: AppColors.primaryColor),
  );
}
