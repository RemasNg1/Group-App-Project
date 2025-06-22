part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ChangeNotificationEvent extends ProfileEvent {}

class LogoutEvent extends ProfileEvent {}

class UpdateProfileInfoEvent extends ProfileEvent {
  final String name;
  final String password;

  UpdateProfileInfoEvent({required this.name, required this.password});
}
