import 'package:flutter/material.dart';
import 'package:geonotes/style/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  // scaffoldBackgroundColor: AppColors.basckground,
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: AppBarTheme(
    // backgroundColor: AppColors.basckground,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
);
