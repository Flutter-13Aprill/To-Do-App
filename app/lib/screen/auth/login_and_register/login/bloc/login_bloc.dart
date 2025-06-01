import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart'; // **** إضافة هذا الاستيراد ****
import 'package:app/layer_data/auth_layer.dart'; // **** إضافة هذا الاستيراد ****
import 'package:supabase_flutter/supabase_flutter.dart'; // لـ AuthException

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // **** إضافة GetIt لاستدعاء AuthLayer ****
  final authGeitit = GetIt.I.get<AuthLayer>();

  LoginBloc() : super(LoginInitial(isButtonEnabled: false)) {
    usernameController.addListener(_onTextFieldChanged);
    passwordController.addListener(_onTextFieldChanged);

    on<LoginFieldsChanged>((event, emit) {
      _updateButtonState(emit);
    });

    on<LoginButtonPressed>((event, emit) async { // جعل الدالة async
      // أولاً، تحقق من صحة الحقول بالشكل المطلوب
      _updateButtonState(emit); // للتأكد من أن حالة الزر محدثة

      if (formKey.currentState!.validate()) {
        print('Form is valid. Attempting login...');
        print('Username: ${usernameController.text}');
        print('Password: ${passwordController.text}');

        emit(LoginLoading()); // إظهار حالة تحميل

        try {
          final String username = usernameController.text.trim();
          final String password = passwordController.text;

          // **** استدعاء دالة تسجيل الدخول الفعلية ****
          await authGeitit.signInMethod(
            username: username,
            password: password,
          );

          emit(LoginSuccess()); // عند النجاح
        } on AuthException catch (e) {
          print('Supabase Auth error during login: ${e.message}');
          String errorMessage = "Invalid login credentials. Please check your username and password.".tr();
          // يمكنك تخصيص رسالة الخطأ هنا بناءً على e.message
          if (e.message.contains("Invalid login credentials")) {
            errorMessage = "Invalid username or password.".tr();
          }
          emit(LoginFailure(errorMessage)); // عند الفشل، قم بتمرير رسالة الخطأ
        } catch (e) {
          print('General Login error: $e');
          emit(LoginFailure("An unexpected error occurred during login.".tr())); // خطأ عام
        }
      } else {
        print('Form validation failed.');
        _updateButtonState(emit); // تأكد من تحديث حالة الزر في حالة فشل التحقق
      }
    });
  }

  void _onTextFieldChanged() {
    add(LoginFieldsChanged());
  }

  void _updateButtonState(Emitter<LoginState> emit) {
    bool isEnabled = usernameController.text.isNotEmpty &&
                     passwordController.text.isNotEmpty;
    // إذا كانت الحالة الحالية هي Loading، فلا يجب تمكين الزر حتى لو كانت الحقول ممتلئة
    if (state is LoginLoading) {
      isEnabled = false;
    }
    emit(LoginInitial(isButtonEnabled: isEnabled));
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Username cannot be empty".tr();
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty".tr();
    }
    return null;
  }

  @override
  Future<void> close() {
    usernameController.removeListener(_onTextFieldChanged);
    passwordController.removeListener(_onTextFieldChanged);
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}