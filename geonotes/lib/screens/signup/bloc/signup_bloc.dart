import 'package:bloc/bloc.dart';
import 'package:geonotes/screens/signup/bloc/signup_state.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<NameChanged>((event, emit) {
      final isValid = RegExp(r'^[A-Z][a-zA-Z0-9]{5,}$').hasMatch(event.name);
      emit(
        state.copyWith(
          name: event.name,
          nameError: isValid ? null : 'Must start with capital & be 6+ chars',
        ),
      );
    });

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
          confirmPasswordError: state.confirmPassword != event.password
              ? 'Passwords do not match'
              : null,
        ),
      );
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          confirmPassword: event.confirmPassword,
          confirmPasswordError: event.confirmPassword != state.password
              ? 'Passwords do not match'
              : null,
        ),
      );
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
    });

    on<ToggleConfirmPasswordVisibility>((event, emit) {
      emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
    });
  }
}
