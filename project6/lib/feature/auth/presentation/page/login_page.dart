import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/extension/git_size_screen.dart';
import 'package:project6/core/extension/navigation.dart';
import 'package:project6/core/helper/form_validation.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/core/widget/button/custom_button.dart';
import 'package:project6/core/widget/button/custom_text_button.dart';
import 'package:project6/core/widget/custom_circular_progress.dart';
import 'package:project6/core/widget/custom_text_field.dart';
import 'package:project6/core/widget/nav/page/bottom_nav_bar.dart';
import 'package:project6/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:project6/feature/auth/presentation/page/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.customPushReplacement(BottomNavBar());
            }
          },
          builder: (context, state) {
            final bloc = context.read<AuthBloc>();
            if (state is AuthLoading) {
              return const Center(child: CustomCircularProgress());
            }

            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: bloc.formKey,
                    onChanged: () {
                      bloc.add(ValidateFormEvent(formKey: bloc.formKey));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 68),
                        Text(AppText.login, style: TextStyles.lato70032),
                        SizedBox(height: 39),
                        CustomTextField(
                          controller: bloc.userNameController,
                          text: AppText.hintUsername,
                          labelText: AppText.username,
                          validator: (value) {
                            return FormValidation.validateInput(
                              value,
                              bloc.usernameRegex,
                            );
                          },
                        ),
                        SizedBox(height: 39),
                        CustomTextField(
                          labelText: AppText.password,
                          controller: bloc.passwordController,
                          obscureText: true,
                          text: AppText.hintPassword,
                          validator: (value) {
                            return FormValidation.validateInput(
                              value,
                              bloc.passwordRegex,
                            );
                          },
                        ),

                        SizedBox(height: 69),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return CustomButton(
                              onPressed:
                                  state is AuthFormValidation && state.isValid
                                  ? () => bloc.add(LogInEvent())
                                  : null,
                              height: 48,
                              width: context.getWidth(),
                              child: Text(
                                AppText.login,
                                style: TextStyles.lato40016,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 33),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppText.account,
                              style: TextStyles.lato40012.copyWith(
                                color: AppPalette.white44,
                              ),
                            ),
                            CustomTextButton(
                              onPressed: () {
                                context.customPush(SignupPage());
                              },
                              text: AppText.register,
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
      ),
    );
  }
}
