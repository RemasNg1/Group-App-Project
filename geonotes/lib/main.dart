
import 'package:flutter/material.dart';
import 'package:geonotes/repository/supabase.dart';
import 'package:geonotes/screens/bottom_navbar/bottom_navbar_screen.dart';
import 'package:geonotes/screens/splash/splash_screen.dart';
import 'package:geonotes/services/setup.dart';
import 'package:geonotes/style/app_theme.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

await SupabaseConnect.init();
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
      home: SplashScreen(),
    );
  }
}
