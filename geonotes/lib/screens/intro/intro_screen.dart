import 'package:flutter/material.dart';
import 'package:geonotes/screens/login/login_screen.dart';
import 'package:geonotes/screens/signup/signup_screen.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/widgets/custom_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.basckground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 24,
            top: 90,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "WELCOME TO",

                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
              ),
              Text(
                "Geonotes",

                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Center(
                child: CustomButton(
                  textColor: Colors.white,
                  text: 'CREATE ACCOUNT',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                ),
              ),
              AppSpacing.h24,
              Center(
                child: CustomButton(
                  text: 'LOG IN',
                  backgroundColor: Colors.white,
                  textColor: AppColors.orange,
                  hasBorder: true,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
