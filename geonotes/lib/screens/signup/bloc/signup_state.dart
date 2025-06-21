class SignupState {
  final String name;
  final String? nameError;
  final String email;
  final String? emailError;
  final String password;
  final String? passwordError;
  final String confirmPassword;
  final String? confirmPasswordError;
  final bool showPassword;
  final bool showConfirmPassword;

  const SignupState({
    this.name = '',
    this.nameError,
    this.email = '',
    this.emailError,
    this.password = '',
    this.passwordError,
    this.confirmPassword = '',
    this.confirmPasswordError,
    this.showPassword = true,
    this.showConfirmPassword = true,
  });

  SignupState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    bool? showPassword,
    bool? showConfirmPassword,
  }) {
    return SignupState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
    );
  }
}
