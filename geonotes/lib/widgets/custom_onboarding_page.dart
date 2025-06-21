import 'package:flutter/material.dart';
import 'package:geonotes/style/app_spacing.dart';

class CustomOnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const CustomOnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300),
          AppSpacing.h24,
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          AppSpacing.h8,
          Text(
            description,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
