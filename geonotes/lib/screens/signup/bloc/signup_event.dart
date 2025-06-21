part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class NameChanged extends SignupEvent {
  final String name;
  NameChanged({required this.name});
}

class EmailChanged extends SignupEvent {
  final String email;
  EmailChanged({required this.email});
}

class PasswordChanged extends SignupEvent {
  final String password;
  PasswordChanged({required this.password});
}

class ConfirmPasswordChanged extends SignupEvent {
  final String confirmPassword;
  ConfirmPasswordChanged({required this.confirmPassword});
}

class TogglePasswordVisibility extends SignupEvent {}

class ToggleConfirmPasswordVisibility extends SignupEvent {}
