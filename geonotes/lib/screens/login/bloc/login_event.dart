part of 'login_bloc.dart';

sealed class LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;
  EmailChanged({required this.email});
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged({required this.password});
}

class TogglePasswordVisibility extends LoginEvent {}
