import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_do_project/core/function/navigator.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/core/widget/custom_button.dart';
import 'package:to_do_project/core/widget/custom_text_button.dart';
import 'package:to_do_project/featuers/auth/bloc/auth_bloc.dart';
import 'package:to_do_project/featuers/auth/presentation/pages/register_screen.dart';
import 'package:to_do_project/featuers/auth/presentation/widget/custom_text_field.dart';
import 'package:to_do_project/featuers/nav/presentation/nav_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessState) {
            customReplacmentNaviagte(context, const BottomNavScreen());
          }
        },
        child: Builder(
          builder: (context) {
            final bloc = context.read<AuthBloc>();

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(150),
                    Text("Login", style: TextStyles.lato700),
                    const Gap(50),
                    Text("Username", style: TextStyles.lato400s16),
                    const Gap(12),
                    CustomTextField(
                      hintText: "Enter your Username",
                      controllere: bloc.controllerName,
                    ),
                    const Gap(50),
                    Text("Password", style: TextStyles.lato400s16),
                    const Gap(12),
                    CustomTextField(
                      hintText: "Enter your Password",
                      controllere: bloc.controllerPassword,
                    ),
                    const Gap(60),
                    Center(
                      child: CustomElvatedButton(
                        press: () {
                          bloc.add(LoginEvent());
                        },
                        height: 48,
                        width: 327,
                        child: const Text("Login"),
                      ),
                    ),
                    const Gap(14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyles.lato400s16.copyWith(
                            color: AppPalete.gray,
                          ),
                        ),
                        CustomTextButton(
                          press: () {
                            customReplacmentNaviagte(
                              context,
                              const RegisterScreen(),
                            );
                          },
                          child: const Text("Register"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
