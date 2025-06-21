import 'package:flutter/material.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/widgets/custom_button.dart';
import 'package:geonotes/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.basckground,
      appBar: AppBar(
        backgroundColor: AppColors.basckground,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Don't worry!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            AppSpacing.h8,
            Text(
              "Enter your email to reset your password",
              style: TextStyle(fontSize: 16, color: AppColors.darkGray),
            ),
            AppSpacing.h32,

            // Email
            CustomTextField(
              hintText: 'Email Address',
              icon: Icons.email_outlined,
              onChanged: (val) {},
            ),
            AppSpacing.h24,

            // New Password
            CustomTextField(
              hintText: 'New Password',
              icon: Icons.lock_outline,
              obscureText: true,
              onChanged: (val) {},
            ),
            AppSpacing.h16,

            // Confirm Password
            CustomTextField(
              hintText: 'Confirm Password',
              icon: Icons.lock_outline,
              obscureText: true,
              onChanged: (val) {},
            ),
            AppSpacing.h80,

            // Save Button
            CustomButton(
              text: 'Save New Password',
              onPressed: () {},
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
