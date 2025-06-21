import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/screens/intro/intro_screen.dart';

import 'package:geonotes/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:geonotes/screens/onboarding/bloc/onboarding_event.dart';
import 'package:geonotes/screens/onboarding/bloc/onboarding_state.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/widgets/custom_button.dart';
import 'package:geonotes/widgets/custom_onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _controller = PageController();
  OnboardingScreen({super.key});

  final List<CustomOnboardingPage> pages = const [
    CustomOnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'Take Notes',
      description: 'Quickly capture what’s on your mind',
    ),
    CustomOnboardingPage(
      image: 'assets/images/onboarding2.png',
      title: 'To-dos',
      description: 'List out your day-to-day tasks',
    ),
    CustomOnboardingPage(
      image: 'assets/images/onboarding3.png',
      title: 'Smart Notes',
      description:
          'Link notes to locations and get smart reminders precisely when you arrive.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.basckground,
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: pages.length,
                    onPageChanged: (index) =>
                        context.read<OnboardingBloc>().add(PageChanged(index)),
                    itemBuilder: (context, index) => pages[index],
                  ),
                ),
                BlocBuilder<OnboardingBloc, OnboardingState>(
                  builder: (context, state) {
                    final isLastPage = state.currentPage == pages.length - 1;

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pages.length,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 12,
                              height: 8,
                              decoration: BoxDecoration(
                                color: state.currentPage == index
                                    ? AppColors.orange
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.h24,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: CustomButton(
                            text: isLastPage ? 'GET STARTED' : 'NEXT',
                            onPressed: () {
                              if (!isLastPage) {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IntroScreen(),
                                  ),
                                );
                              }
                            },
                            textColor: Colors.white,
                          ),
                        ),
                        AppSpacing.h40,
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
