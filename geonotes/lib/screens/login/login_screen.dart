import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/screens/bottom_navbar/bottom_navbar_screen.dart';
import 'package:geonotes/screens/forgot_password/forgot_password_screen.dart';
import 'package:geonotes/screens/home/home_screen.dart';
import 'package:geonotes/screens/login/bloc/login_bloc.dart';
import 'package:geonotes/screens/login/bloc/login_state.dart';
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
                    CustomTextField(
                      hintText: 'Email Address',
                      icon: Icons.email_outlined,
                      onChanged: (val) => bloc.add(EmailChanged(email: val)),
                    ),
                    if (state.emailError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          state.emailError!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    AppSpacing.h16,

                    // Password
                    CustomTextField(
                      hintText: 'Password',
                      icon: Icons.lock_outline,
                      obscureText: state.showPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => context.read<LoginBloc>().add(
                          TogglePasswordVisibility(),
                        ),
                      ),
                      onChanged: (val) =>
                          bloc.add(PasswordChanged(password: val)),
                    ),
                    if (state.passwordError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          state.passwordError!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(),
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
                    AppSpacing.h80,
                    // Button
                    CustomButton(
                      text: 'Log In ',
                      onPressed: () {
                        if (state.emailError == null &&
                            state.passwordError == null &&
                            state.email.isNotEmpty &&
                            state.password.isNotEmpty) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNavbarScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fix the errors"),
                            ),
                          );
                        }
                      },
                      textColor: Colors.white,
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
