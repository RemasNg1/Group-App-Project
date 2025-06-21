import 'package:flutter/material.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';

class Avatar extends StatelessWidget {
  final String imagePath;

  const Avatar({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        imagePath,
        width: context.getWidth(factor: 0.3),
        height: context.getHeight(factor: 0.13),
        fit: BoxFit.cover,
      ),
    );
  }
}
