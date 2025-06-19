import 'package:flutter/material.dart';
import 'package:todo_list/style/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.purple,
    colorScheme: ColorScheme.light(
      primary: AppColors.purple,
      secondary: AppColors.lightPurole,
      onPrimary: Colors.white,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.purple,
    colorScheme: ColorScheme.dark(
      primary: AppColors.purple,
      secondary: AppColors.lightPurole,
      onPrimary: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.whiteTransparent),
      bodyMedium: TextStyle(color: AppColors.white44),
    ),
  );
}
