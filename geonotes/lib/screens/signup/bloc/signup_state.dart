part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {}

class PasswordVisibilityState extends SignupState {}

class ConfirmPasswordVisibilityState extends SignupState {}
