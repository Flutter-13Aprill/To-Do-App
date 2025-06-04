import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:to_do_app_development/Screen/Authintication/cubit/Register_cubit.dart';
import 'package:to_do_app_development/Screen/Login_Screen.dart';
import 'package:to_do_app_development/Screen/NavigatorsBar_Screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterCubit _bloc = RegisterCubit();
  final _formKey = GlobalKey<FormState>();

  static const inputFillColor = Color(0xFF1E1E1E);
  static const inputBorderColor = Color(0xFF333333);
  static const Color primaryPurple = Color(0xFF8687E7);
  static const Color disabledPurple = Color(0x808687E7);
  static const hintColor = Color(0xFF555555);
  static const labelColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 120, 30, 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Text(
                    'register'.tr(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    textAlign: context.locale.languageCode == 'ar'
                      ? TextAlign.right
                      : TextAlign.left,
                    ),
                  const SizedBox(height: 32),

                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'username'.tr(),
                          style: const TextStyle(
                            color: labelColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        StreamBuilder<String>(
                          stream: _bloc.usernameStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              onChanged: _bloc.changeUsername,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'enter_username'.tr(),
                                hintStyle: const TextStyle(color: hintColor),
                                filled: true,
                                fillColor: inputFillColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: inputBorderColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: inputBorderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: primaryPurple,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                                errorText: (snapshot.hasError)
                                    ? snapshot.error as String?
                                    : null,
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'username_empty'.tr();
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20),

                        Text(
                          'password'.tr(),
                          style: const TextStyle(
                            color: labelColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        StreamBuilder<String>(
                          stream: _bloc.passwordStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              onChanged: _bloc.changePassword,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: '●●●●●●●●●●●●',
                                hintStyle: const TextStyle(color: hintColor),
                                filled: true,
                                fillColor: inputFillColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: inputBorderColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: inputBorderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: primaryPurple,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                                errorText: (snapshot.hasError)
                                    ? snapshot.error as String?
                                    : null,
                              ),
                              obscureText: true,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'password_empty'.tr();
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20),

                        Text(
                          'confirm_password'.tr(),
                          style: const TextStyle(
                            color: labelColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        StreamBuilder<String>(
                          stream: _bloc.confirmPasswordStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              onChanged: _bloc.changeConfirmPassword,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: '●●●●●●●●●●●●',
                                hintStyle: const TextStyle(color: hintColor),
                                filled: true,
                                fillColor: inputFillColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: inputBorderColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: inputBorderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: primaryPurple,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                                errorText: (snapshot.hasError)
                                    ? snapshot.error as String?
                                    : null,
                              ),
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'confirm_password_empty'.tr();
                                }
                                if (value != _bloc.currentPassword) {
                                  return 'password_mismatch'.tr();
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),

                  StreamBuilder<bool>(
                    stream: _bloc.isValid,
                    initialData: false,
                    builder: (context, snapshot) {
                      final isEnabled = snapshot.data ?? false;
                        return SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                          if (!isEnabled) return;
                          _bloc.submit(
                            onSuccess: (username, password) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                              content: Row(
                                children: [
                                const Icon(Icons.check_circle, color: Colors.greenAccent),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                  'registration_success'.tr(args: [username]),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ],
                              ),
                              backgroundColor: Colors.black87,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              duration: const Duration(seconds: 2),
                              ),
                            );
                             Future.delayed(const Duration(milliseconds: 800), () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavigatorsBarScreen(),
                                ),
                              );
                            });
                            },
                            onError: (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                              content: Row(
                                children: [
                                const Icon(Icons.error, color: Colors.redAccent),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                  error,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ],
                              ),
                              backgroundColor: Colors.black87,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              duration: const Duration(seconds: 2),
                              ),
                            );
                            },
                          );
                          },
                          style: ElevatedButton.styleFrom(
                          backgroundColor:
                            isEnabled ? primaryPurple : disabledPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          ),
                          child: Text(
                            'register'.tr(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                      children: [
                        TextSpan(text:'have_account'.tr()),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'login'.tr(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
