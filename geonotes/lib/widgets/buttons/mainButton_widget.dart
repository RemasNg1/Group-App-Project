import 'package:flutter/material.dart';
import 'package:geonotes/style/app_colors.dart';

class MainButtonWidget extends StatelessWidget {
   const MainButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.width,
  });
  final  Function() onTap;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 56,
        decoration:  BoxDecoration(
          color:AppColors.blue,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
