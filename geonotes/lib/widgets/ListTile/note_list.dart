import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/models/response/note_response_model.dart';
import 'package:geonotes/screens/add_note/add_note.dart';
import 'package:geonotes/screens/map/bloc/map_bloc.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key, required this.note});
  final NoteResponse note;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNote(note: note)),
          );
        },
        child: ListTile(
          leading: Container(
            height: context.getHeight(factor: 0.1),
            width: context.getWidth(factor: 0.14),
            decoration: BoxDecoration(
              color: AppColors.grayTransparent,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: const Icon(Icons.location_on_outlined),
          ),
          title: Text(note.title!),
          subtitle: Text(note.content!),
          trailing: InkWell(
            onTap: () {
              context.read<MapBloc>().add(DeleteNote(deletedNote: note!));
            },
            child: Icon(Icons.delete_forever),
          ),
        ),
      ),
    );
  }
}
