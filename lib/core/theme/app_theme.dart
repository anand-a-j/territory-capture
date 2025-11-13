import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

class AppThemes with AppColorScheme {
  static lightThemeData(BuildContext context) => ThemeData(
    primaryColor: AppColorScheme.primary,
    scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light(
      primary: AppColorScheme.primary,
      onPrimary: AppColorScheme.onPrimary,
      secondary: AppColorScheme.secondary,
      error: AppColorScheme.error,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 10,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontSize: 8,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontSize: 6,
        color: AppColorScheme.secondary,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0,
      backgroundColor: AppColorScheme.scaffoldBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColorScheme.secondary,
        grade: -25,
        weight: 100,
      ),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColorScheme.onPrimary,
      ),
    ),
   
    iconTheme: const IconThemeData(
      color: AppColorScheme.onPrimary,
      weight: 100,
      grade: -25,
    ),
  );
}
