import 'package:app/screen/auth/login_and_register/login/login_screen.dart';
import 'package:app/screen/auth/login_and_register/register/bloc/registor_bloc.dart';
import 'package:app/screen/auth/login_and_register/widget/button/button.dart';
import 'package:app/screen/auth/login_and_register/widget/texfekd/textfeild.dart';
import 'package:app/screen/index/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app/extension/Screen/get_size_screen.dart'; // تأكد من صحة هذا المسار
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<RegisterBloc>();

          return Scaffold(
            appBar: AppBar(),
            body: BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.msg)), // اعرض رسالة الخطأ الفعلية
                  );
                }
                if (state is RegisterSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Registration Successful!".tr())),
                  );
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
                }
              },
              builder: (context, state) {
                bool isButtonEnabled = false;
                String? usernameError;
                String? passwordError;
                String? confirmPasswordError;

                if (state is RegisterInitial) {
                  isButtonEnabled = state.isButtonEnabled;
                  usernameError = state.usernameError;
                  passwordError = state.passwordError;
                  confirmPasswordError = state.confirmPasswordError;
                } else if (state is RegisterLoading) {
                  isButtonEnabled = false;
                  return const Center(child: CircularProgressIndicator()); // إظهار مؤشر التحميل أثناء التحميل
                }

                return Form(
                  key: bloc.formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "REGISTER".tr(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 30),

                          // حقل اسم المستخدم (الوحيد الذي يظهر للمستخدم)
                          Text(
                            "Username".tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Textfeild(
                            controller: bloc.usernameController,
                            hint: "Enter your Username",
                            validator: (value) => usernameError,
                            onChanged: (text) {
                              context.read<RegisterBloc>().add(RegisterFieldsChanged());
                            },
                          ),
                          const SizedBox(height: 20),

                          // حقل كلمة المرور
                          Text(
                            "Password".tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Textfeild(
                            controller: bloc.passwordController,
                            isPassword: true,
                            hint: '. . . . . . . .',
                            validator: (value) => passwordError,
                            onChanged: (text) {
                              context.read<RegisterBloc>().add(RegisterFieldsChanged());
                            },
                          ),
                          const SizedBox(height: 20),

                          // حقل تأكيد كلمة المرور
                          Text(
                            "Confirm Password".tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Textfeild(
                            controller: bloc.confirmPasswordController,
                            isPassword: true,
                            hint: '. . . . . . . .',
                            validator: (value) => confirmPasswordError,
                            onChanged: (text) {
                              context.read<RegisterBloc>().add(RegisterFieldsChanged());
                            },
                          ),
                          const SizedBox(height: 30),

                          Button(
                            title: "REGISTER",
                            onPressed: () {
                              context.read<RegisterBloc>().add(RegisterButtonPressed());
                            },
                            isEnabled: isButtonEnabled,
                          ),
                          const SizedBox(height: 20),

                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // العودة إلى شاشة تسجيل الدخول
                              },
                              child: Text(
                                "Already have an account? Login".tr(),
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}