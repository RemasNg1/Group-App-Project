import 'package:bloc/bloc.dart';

import 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>((event, emit) {
      final isValid = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
      ).hasMatch(event.email);
      emit(
        state.copyWith(
          email: event.email,
          emailError: isValid ? null : 'Invalid email format',
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      final isValid = event.password.length >= 6;
      emit(
        state.copyWith(
          password: event.password,
          passwordError: isValid ? null : 'Password must be 6+ characters',
        ),
      );
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
    });
  }
}
