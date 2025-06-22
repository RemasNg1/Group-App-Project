part of 'map_bloc.dart';

@immutable
sealed class MapEvent {}

class AddMapAddressWithNote extends MapEvent {
  final NoteModel newNote;
  AddMapAddressWithNote({required this.newNote});
}
class UpdateNote extends MapEvent {
 final NoteResponse updatedNote;

  UpdateNote({required this.updatedNote});
}
class DeleteNote extends MapEvent {
 final NoteResponse deletedNote;

  DeleteNote({required this.deletedNote});
}