import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/screens/bottom_navbar/bottom_navbar_screen.dart';
import 'package:geonotes/screens/forgot_password/forgot_password_screen.dart';
import 'package:geonotes/screens/login/bloc/login_bloc.dart';
import 'package:geonotes/screens/signup/signup_screen.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/widgets/custom_button.dart';
import 'package:geonotes/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        backgroundColor: AppColors.basckground,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 90),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final bloc = context.read<LoginBloc>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome back !",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSpacing.h8,
                    const Text(
                      "Please login with your credentials",
                      style: TextStyle(fontSize: 16),
                    ),
                    AppSpacing.h24,
                    // Email
                    Form(
                      key: bloc.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: bloc.emailController,
                            hintText: 'Email Address',
                            icon: Icons.email_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              final emailRegex = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          AppSpacing.h16,

                          // Password
                          CustomTextField(
                            controller: bloc.passwordController,
                            hintText: 'Password',
                            icon: Icons.lock_outline,
                            obscureText: bloc.isPasswordHidden,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }

                              return null;
                            },

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
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          AppSpacing.h80,
                          Column(
                            children: [
                              Text("Don’t have an account yet?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Create an account here',
                                  style: TextStyle(color: AppColors.orange),
                                ),
                              ),
                            ],
                          ),
                          AppSpacing.h80,
                          BlocConsumer<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccess) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const BottomNavbarScreen(),
                                  ),
                                );
                              } else if (state is LoginFailure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      state.error,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return CustomButton(
                                text: 'Log In ',
                                onPressed: () {
                                  if (bloc.formKey.currentState!.validate()) {
                                    bloc.add(LoginButtonPressed());
                                  }
                                },
                                textColor: Colors.white,
                              );
                            },
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
