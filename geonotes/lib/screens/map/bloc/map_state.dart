part of 'map_bloc.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

final class AddMapAddressSuccessfully extends MapState {}
final class UpdateNoteSuccessfully extends MapState {}
final class DeleteNoteSuccessfully extends MapState {}
