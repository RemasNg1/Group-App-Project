import 'package:flutter/material.dart';
import 'package:geonotes/repository/supabase.dart';
import 'package:geonotes/screens/bottom_navbar/bottom_navbar_screen.dart';
import 'package:geonotes/services/setup.dart';
import 'package:geonotes/style/app_theme.dart';

void main() async{
await SupabaseConnection.init();
   setup();
   await Future.delayed(const Duration(seconds: 2));

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
