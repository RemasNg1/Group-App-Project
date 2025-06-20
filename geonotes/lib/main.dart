import 'package:flutter/material.dart';
import 'package:geonotes/screens/bottom_navbar/bottom_navbar_screen.dart';
import 'package:geonotes/style/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: BottomNavbarScreen(),
    );
  }
}
