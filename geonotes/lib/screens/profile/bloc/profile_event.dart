part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ChangeNotificationEvent extends ProfileEvent {}
