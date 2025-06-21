import 'package:flutter/material.dart';
import 'package:geonotes/style/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool hasBorder;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.hasBorder = false,
    required Color textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.orange,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: hasBorder
                ? BorderSide(color: AppColors.orange, width: 1.5)
                : BorderSide.none,
          ),
        ),
        child: Text(
          text,
          style:
              textStyle ??
              TextStyle(
                color: hasBorder ? AppColors.orange : Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
