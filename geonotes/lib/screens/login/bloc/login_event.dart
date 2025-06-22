part of 'login_bloc.dart';

sealed class LoginEvent {}

class LoginButtonPressed extends LoginEvent {}

class TogglePasswordVisibility extends LoginEvent {}
