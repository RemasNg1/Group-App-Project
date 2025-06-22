import 'package:flutter/material.dart';
import 'package:geonotes/models/note_model.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';
import 'package:geonotes/widgets/TextField/custom_text_form_field.dart';
import 'package:geonotes/widgets/buttons/mainButton_widget.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key, required this.saveNote});
  final Function(Map<String, String> newNote) saveNote;
  @override
  Widget build(BuildContext context) {
    final Map<String, String> newNote = {"title": "", "content": ""};
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: Text("New Note"),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 24,
              children: [
                AppSpacing.h16,
                CustomTextFormField(
                  hintText: 'Title',
                  onChanged: (String text) {
                    newNote["title"] = text;
                  },
                ),
                CustomTextFormField(
                  isDescription: true,
                  hintText: 'Description',
                  onChanged: (String text) {
                    newNote["content"] = text;
                  },
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MainButtonWidget(
                        onTap: () {
                          saveNote(newNote);
                          Navigator.pop(context);
                        },
                        text: 'Save',
                        width: context.getWidth(factor: 0.7),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
