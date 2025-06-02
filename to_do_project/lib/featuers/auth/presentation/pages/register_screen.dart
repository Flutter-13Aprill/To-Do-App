import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:to_do_project/core/function/navigator.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/core/theme/app_palete.dart';
import 'package:to_do_project/core/widget/custom_button.dart';
import 'package:to_do_project/core/widget/custom_text_button.dart';
import 'package:to_do_project/featuers/auth/bloc/auth_bloc.dart';
import 'package:to_do_project/featuers/auth/presentation/pages/log_in_screen.dart';
import 'package:to_do_project/featuers/auth/presentation/widget/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessState) {
            customReplacmentNaviagte(context, LogInScreen());
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
                    Gap(150),
                    Text("Register", style: TextStyles.lato700),
                    Gap(50),
                    Text("Username", style: TextStyles.lato400s16),
                    Gap(12),
                    CustomTextField(
                      hintText: "Enter your Username",
                      controllere: bloc.controllerName,
                    ),
                    Gap(50),
                    Text("Password", style: TextStyles.lato400s16),
                    Gap(12),
                    CustomTextField(
                      hintText: "Enter your Username",
                      controllere: bloc.controllerPassword,
                    ),
                    Gap(50),
                    Text("Confirm Password", style: TextStyles.lato400s16),
                    Gap(12),
                    CustomTextField(
                      hintText: ".  .  .  .",
                      controllere: bloc.controllerPass,
                    ),
                    Gap(60),
                    Center(
                      child: CustomElvatedButton(
                        press: () {
                          bloc.add(RegesterEvent());
                        },
                        height: 48,
                        width: 327,
                        child: Text("Register"),
                      ),
                    ),
                    Gap(14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyles.lato400s16.copyWith(
                            color: AppPalete.gray,
                          ),
                        ),
                        CustomTextButton(press: () {}, child: Text("Login")),
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
