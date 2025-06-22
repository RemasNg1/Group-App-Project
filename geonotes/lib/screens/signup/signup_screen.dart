import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/screens/bottom_navbar/bottom_navbar_screen.dart';

import 'package:geonotes/screens/login/login_screen.dart';
import 'package:geonotes/screens/signup/bloc/signup_bloc.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/widgets/custom_button.dart';
import 'package:geonotes/widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupBloc(),
      child: Scaffold(
        backgroundColor: AppColors.basckground,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 90),
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                final bloc = context.read<SignupBloc>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let’s get to know you !",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSpacing.h8,
                    const Text(
                      "Enter your details to continue",
                      style: TextStyle(fontSize: 16),
                    ),
                    AppSpacing.h24,
                    Form(
                      key: bloc.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Username
                          CustomTextField(
                            controller: bloc.nameController,
                            hintText: "Display Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter display name';
                              }
                              return null;
                            },
                            icon: Icons.person_outline,
                          ),
                          AppSpacing.h16,
                          // Email
                          CustomTextField(
                            controller: bloc.emailController,
                            hintText: 'Email Address',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              final emailRegex = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            icon: Icons.email_outlined,
                          ),

                          AppSpacing.h16,

                          // Password
                          CustomTextField(
                            controller: bloc.passwordController,

                            hintText: 'Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            icon: Icons.lock_outline,
                            obscureText: bloc.isPasswordHidden,
                            suffixIcon: IconButton(
                              icon: Icon(
                                bloc.isPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () =>
                                  bloc.add(TogglePasswordVisibility()),
                            ),
                          ),
                          AppSpacing.h16,

                          // Confirm Password
                          CustomTextField(
                            hintText: 'Confirm Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm password';
                              }
                              if (value != bloc.passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            icon: Icons.lock_outline,
                            obscureText: bloc.isConfirmPasswordHidden,
                            suffixIcon: IconButton(
                              icon: Icon(
                                bloc.isConfirmPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () =>
                                  bloc.add(ToggleConfirmPasswordVisibility()),
                            ),
                          ),
                          AppSpacing.h24,
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Login here',
                              style: TextStyle(color: AppColors.orange),
                            ),
                          ),
                          AppSpacing.h80,
                          // Button
                          CustomButton(
                            text: 'SIGN UP',
                            onPressed: () {
                              if (bloc.formKey.currentState!.validate()) {
                                bloc.add(SignUpEvent());
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavbarScreen(),
                                  ),
                                );
                              }
                            },
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
