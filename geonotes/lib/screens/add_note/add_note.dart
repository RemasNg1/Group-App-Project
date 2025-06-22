import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/models/response/note_response_model.dart';
import 'package:geonotes/screens/map/bloc/map_bloc.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';
import 'package:geonotes/widgets/TextField/custom_text_form_field.dart';
import 'package:geonotes/widgets/buttons/mainButton_widget.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key, this.saveNote, this.note});
  final Function(Map<String, String> newNote)? saveNote;
  NoteResponse? note;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> newNote = {"title": "", "content": ""};
    return BlocProvider(
      create: (context) => MapBloc(),
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
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
                        initialValue: note?.title,
                        onChanged: (String text) {
                          newNote["title"] = text;
                        },
                      ),
                      CustomTextFormField(
                        isDescription: true,
                        hintText: 'Description',
                        initialValue: note?.content,

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
                                if (note == null) {
                                  saveNote!(newNote);
                                } else {
                                  note!.title = newNote["title"];
                                  note!.content = newNote["content"];
                                  context.read<MapBloc>().add(
                                    UpdateNote(updatedNote: note!),
                                  );
                                }
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
        },
      ),
    );
  }
}
