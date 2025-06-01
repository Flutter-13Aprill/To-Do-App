part of 'registor_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {
  final bool isButtonEnabled;
  final String? usernameError;
  // final String? emailError; // تأكد أن هذا السطر غير موجود هنا
  final String? passwordError;
  final String? confirmPasswordError;

  RegisterInitial({
    this.isButtonEnabled = false,
    this.usernameError,
    // this.emailError, // تأكد أن هذا السطر غير موجود هنا
    this.passwordError,
    this.confirmPasswordError,
  });

  @override
  List<Object?> get props => [
    isButtonEnabled,
    usernameError,
     passwordError,
    confirmPasswordError,
  ];

  RegisterInitial copyWith({
    bool? isButtonEnabled,
    String? usernameError,
    // String? emailError, // تأكد أن هذا السطر غير موجود هنا
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return RegisterInitial(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      usernameError: usernameError,
       passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }
}

class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterFailure extends RegisterState {
  final String msg;

  RegisterFailure({required this.msg});
}