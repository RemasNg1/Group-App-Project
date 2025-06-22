part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignUpEvent extends SignupEvent {}

class TogglePasswordVisibility extends SignupEvent {}

class ToggleConfirmPasswordVisibility extends SignupEvent {}
