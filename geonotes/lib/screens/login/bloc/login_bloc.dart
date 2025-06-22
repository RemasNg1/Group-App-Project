import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geonotes/layer_data/auth_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authGetit = GetIt.I.get<AuthLayer>();
  final formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(signinMethod);

    on<TogglePasswordVisibility>((event, emit) {
      isPasswordHidden = !isPasswordHidden;
      emit(PasswordVisibilityState());
    });
  }

  FutureOr<void> signinMethod(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await authGetit.signInMethod(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure("Wrong email or password. Please try again."));
    }
  }
}
