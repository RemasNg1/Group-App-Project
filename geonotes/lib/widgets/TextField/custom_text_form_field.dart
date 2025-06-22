import 'package:flutter/material.dart';
import 'package:geonotes/style/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.isDescription = false, 
    this.initialValue,
  });
  final String hintText;
  final String? initialValue;
  final bool isDescription;
  final Function(String text) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines:isDescription ? 16 : 3,
      minLines:isDescription ? 8 :1,
      onChanged: onChanged,
      initialValue:initialValue ,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grayTransparent,
        hintText: hintText,
        
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
