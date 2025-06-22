import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/screens/profile/bloc/profile_bloc.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';
import 'package:geonotes/widgets/custom_text_field.dart';

class EditInfoDialog extends StatelessWidget {
  const EditInfoDialog({super.key});

  // This dialog allows users to edit and save their display name and password with validation.

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: EdgeInsets.zero,
      title: SizedBox(
        height: 48,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Edit Inormation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          height: context.getHeight(factor: 0.19),
          child: Form(
            key: bloc.formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: bloc.nameController,
                  hintText: "Display Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter display name';
                    }
                    return null;
                  },
                  icon: Icons.person_outline,
                ),
                AppSpacing.h24,
                CustomTextField(
                  controller: bloc.passwordController,
                  hintText: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),

      actions: [
        SizedBox(
          width: context.getWidth(factor: 0.6),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (bloc.formKey.currentState!.validate()) {
                final name = bloc.nameController.text;
                final password = bloc.passwordController.text;

                bloc.add(
                  UpdateProfileInfoEvent(name: name, password: password),
                );

                Navigator.pop(context);
              }
            },

            child: Text(
              "Save",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
