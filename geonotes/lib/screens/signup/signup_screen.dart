import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/screens/home/home_screen.dart';
import 'package:geonotes/screens/login/login_screen.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/widgets/custom_button.dart';
import 'package:geonotes/widgets/custom_text_field.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_state.dart';

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

                    // Username
                    CustomTextField(
                      hintText: "Display Name",
                      icon: Icons.person_outline,
                      onChanged: (val) => bloc.add(NameChanged(name: val)),
                    ),
                    if (state.nameError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          state.nameError!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    AppSpacing.h16,

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
                        onPressed: () => context.read<SignupBloc>().add(
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
                    AppSpacing.h16,

                    // Confirm Password
                    CustomTextField(
                      hintText: 'Confirm Password',
                      icon: Icons.lock_outline,
                      obscureText: state.showConfirmPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.showConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => context.read<SignupBloc>().add(
                          ToggleConfirmPasswordVisibility(),
                        ),
                      ),
                      onChanged: (val) => bloc.add(
                        ConfirmPasswordChanged(confirmPassword: val),
                      ),
                    ),
                    if (state.confirmPasswordError != null)
                      Text(
                        state.confirmPasswordError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
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
                        if (state.nameError == null &&
                            state.emailError == null &&
                            state.passwordError == null &&
                            state.confirmPasswordError == null &&
                            state.name.isNotEmpty &&
                            state.email.isNotEmpty &&
                            state.password.isNotEmpty &&
                            state.confirmPassword.isNotEmpty) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const homeScreen(),
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
