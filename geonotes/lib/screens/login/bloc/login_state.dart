// class LoginState {
//   final String email;
//   final String? emailError;
//   final String password;
//   final String? passwordError;
//   final bool showPassword;

//   const LoginState({
//     this.email = '',
//     this.emailError,
//     this.password = '',
//     this.passwordError,
//     this.showPassword = true,
//   });

//   LoginState copyWith({
//     String? email,
//     String? emailError,
//     String? password,
//     String? passwordError,
//     bool? showPassword,
//   }) {
//     return LoginState(
//       email: email ?? this.email,
//       emailError: emailError,
//       password: password ?? this.password,
//       passwordError: passwordError,
//       showPassword: showPassword ?? this.showPassword,
//     );
//   }
// }

part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

class PasswordVisibilityState extends LoginState {}

final class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}
