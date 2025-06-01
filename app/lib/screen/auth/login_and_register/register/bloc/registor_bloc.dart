 
import 'dart:developer';

import 'package:app/layer_data/auth_layer.dart';
import 'package:app/repo/supabase.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';

part 'registor_event.dart';
part 'registor_state.dart';

class RegisterBloc extends Bloc<RegistorEvent, RegisterState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final authGeitit = GetIt.I.get<AuthLayer>();

  Timer? _debounce;

  RegisterBloc() : super(RegisterInitial(isButtonEnabled: false)) {
    usernameController.addListener(_onTextFieldChangedDebounced);
    passwordController.addListener(_onTextFieldChanged);
    confirmPasswordController.addListener(_onTextFieldChanged);

    on<RegisterFieldsChanged>((event, emit) async {
      _validateAndEmitState(emit);
    });

    on<RegisterButtonPressed>((event, emit) async {
      // إعادة تقييم الحالة لضمان أن جميع الأخطاء محدثة قبل محاولة التسجيل
      await _validateAndEmitState(emit); // استخدام await هنا

      // تأكد من أن حالة الـ BLoC هي RegisterInitial (يعني لا يوجد أخطاء)
      // وأن الزر ممكّن (يعني أن جميع الحقول صالحة ولا يوجد أخطاء فرادة من الـ validator)
      if (formKey.currentState!.validate() &&
          (state is RegisterInitial &&
              (state as RegisterInitial).isButtonEnabled)) {
        print('Form is valid. Attempting registration...');
        print('Username: ${usernameController.text}');
        print('Password: ${passwordController.text}');

        emit(RegisterLoading()); // إظهار حالة تحميل

        try {
          final String username = usernameController.text.trim();

          // ************ التعديل هنا: البريد الإلكتروني الوهمي الآن يستخدم @gmail.com ************
          final String dummyEmail =
              '${username.toLowerCase().replaceAll(RegExp(r'\s+'), '')}@gmail.com';
              log(dummyEmail);
              log(passwordController.text);
          print(
            'Generated dummy email for Supabase Auth: $dummyEmail',
          ); // لغرض التصحيح
          // *********************************************************

          await authGeitit.signUpMethod(
            email: dummyEmail,
            password: passwordController.text,
            username:
                username, // يتم تمرير اسم المستخدم ليتم حفظه في جدول user_profiles
          );
          emit(RegisterSuccess());
        } on AuthException catch (e) {
          print('Supabase Auth error during registration: ${e.message}');
          // التعامل مع أخطاء Supabase Auth (مثلاً، بريد إلكتروني موجود بالفعل في Supabase Auth)
          String errorMessage = e.message;
          if (e.message.contains("User already registered")) {
            // هذا قد يحدث إذا حاول نفس اسم المستخدم التسجيل مرة أخرى
            // (مما يعني أن dummyEmail@gmail.com مسجل بالفعل في Supabase Auth)
            errorMessage =
                "This username is already taken (via associated email).".tr();
          }
          emit(RegisterFailure(msg: errorMessage));
        } catch (e) {
          print('General Registration error: $e');
          emit(
            RegisterFailure(
              msg: "An unexpected error occurred during registration.".tr(),
            ),
          );
        }
      } else {
        print(
          'Form validation failed or username already exists (from initial check).',
        );
      }
    });
  }

  void _onTextFieldChanged() {
    add(RegisterFieldsChanged());
  }

  void _onTextFieldChangedDebounced() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      add(RegisterFieldsChanged());
    });
  }

  Future<void> _validateAndEmitState(Emitter<RegisterState> emit) async {
    String? currentUsernameError = _usernameValidator(usernameController.text);

    // فقط تحقق من فرادة اسم المستخدم في قاعدة البيانات إذا لم يكن هناك خطأ في التنسيق الأولي
    if (currentUsernameError == null && usernameController.text.isNotEmpty) {
      final String username = usernameController.text.trim();
      //bool exists = await SupabaseConnect.checkIfUsernameExistsInDb(username);
      //if (exists) {
      // currentUsernameError = "This username is already taken.".tr();
      //}
    }

    final String? currentPasswordError = _passwordValidator(
      passwordController.text,
    );
    final String? currentConfirmPasswordError = _confirmPasswordValidator(
      confirmPasswordController.text,
    );

    // يتم تمكين الزر بناءً على أخطاء التنسيق وامتلاء الحقول ونتيجة فحص فرادة اسم المستخدم
    bool isEnabled =
        usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        currentUsernameError == null && // خطأ التنسيق + خطأ الفرادة
        currentPasswordError == null &&
        currentConfirmPasswordError == null;

    emit(
      RegisterInitial(
        isButtonEnabled: isEnabled,
        usernameError: currentUsernameError,
        passwordError: currentPasswordError, // <--- تم التصحيح هنا
        confirmPasswordError:
            currentConfirmPasswordError, // <--- تم التصحيح هنا
      ),
    );
  }

  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Username cannot be empty".tr();
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty".tr();
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters".tr();
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm Password cannot be empty".tr();
    }
    if (value != passwordController.text) {
      return "Passwords do not match".tr();
    }
    return null;
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    usernameController.removeListener(_onTextFieldChangedDebounced);
    passwordController.removeListener(_onTextFieldChanged);
    confirmPasswordController.removeListener(_onTextFieldChanged);
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
