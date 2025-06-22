import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geonotes/layer_data/auth_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final authGetit = GetIt.I.get<AuthLayer>();

  SignupBloc() : super(SignupInitial()) {
    on<SignUpEvent>(signupMethod);
    on<TogglePasswordVisibility>((event, emit) {
      isPasswordHidden = !isPasswordHidden;
      emit(PasswordVisibilityState());
    });

    on<ToggleConfirmPasswordVisibility>((event, emit) {
      isConfirmPasswordHidden = !isConfirmPasswordHidden;
      emit(ConfirmPasswordVisibilityState());
    });
  }
  FutureOr<void> signupMethod(
    SignUpEvent event,
    Emitter<SignupState> emit,
  ) async {
    await authGetit.signUpMethod(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    emit(SignupSuccess());
  }
}
