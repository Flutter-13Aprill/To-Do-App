import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/extension/git_size_screen.dart';
import 'package:project6/core/extension/navigation.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/core/widget/button/custom_button.dart';
import 'package:project6/core/widget/button/custom_text_button.dart';
import 'package:project6/core/widget/custom_text_field.dart';
import 'package:project6/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:project6/feature/auth/presentation/page/login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AuthBloc>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: bloc.formKey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 33),
                      Text(AppText.register, style: TextStyles.lato70032),
                      SizedBox(height: 23),
                      CustomTextField(
                        controller: bloc.userNameController,
                        text: AppText.hintUsername,
                        labelText: AppText.username,
                      ),
                      SizedBox(height: 25),
                      CustomTextField(
                        labelText: AppText.password,
                        controller: bloc.passwordController,
                        obscureText: true,
                        text: AppText.hintPassword,
                      ),
                      SizedBox(height: 25),
                      CustomTextField(
                        labelText: AppText.confirm,
                        controller: bloc.confirmController,
                        obscureText: true,
                        text: AppText.hintPassword,
                      ),
                      SizedBox(height: 40),
                      CustomButton(
                        onPressed: () {},
                        height: 48,
                        width: context.getWidth(),
                        child: Text(
                          AppText.register,
                          style: TextStyles.lato40016,
                        ),
                      ),
                      SizedBox(height: 33),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppText.haveAccount,
                            style: TextStyles.lato40012.copyWith(
                              color: AppPalette.white44,
                            ),
                          ),
                  
                          CustomTextButton(
                            onPressed: () {
                              context.customPush(LoginPage());
                            },
                            text: AppText.login,
                            styles: TextStyles.lato40012,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
