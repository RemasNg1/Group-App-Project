part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class SuccessState extends ProfileState {}

class LogoutSuccess extends ProfileState {}

class LogoutFailure extends ProfileState {
  final String error;
  LogoutFailure(this.error);
}

class ProfileUpdatedSuccessfully extends ProfileState {}

class ProfileError extends ProfileState {}
