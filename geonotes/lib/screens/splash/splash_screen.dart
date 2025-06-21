import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/screens/onboarding/onboarding_screen.dart';
import 'package:geonotes/style/app_colors.dart';

import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  //splash
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocProvider(
          create: (context) => SplashBloc()..add(StartSplash()),
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is SplashFinished) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.basckground,
              body: BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo.png', width: 300),
                          ],
                        ),

                        Text(
                          'geography Notes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
