import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helpers/extensions/navigation_extensions.dart';
import 'package:uptodo/core/helpers/validator/textfield_validator.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/widgets/app_custom_button.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/Authentication/logic/bloc/auth_bloc.dart';
import 'package:uptodo/features/Authentication/presentation/login_screen.dart';
import 'package:uptodo/features/Authentication/presentation/widgets/auth_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          final authBloc = context.read<AuthBloc>();

          return FocusScope(
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if(state is SuccessCreatingAccount){
                  context.goTo(screen: LoginScreen());
                }
              },
              child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          EmptySpace.sizeH72,

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              tr('auth_screen.register'),
                              style: TextStyles.lato70032,
                            ),
                          ),

                          EmptySpace.sizeH40,

                          Form(
                            key: authBloc.formKey,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    tr('auth_screen.username'),
                                    style: TextStyles.lato40018,
                                  ),
                                ),

                                EmptySpace.sizeH8,

                                AuthTextfield(
                                  focusNode: authBloc.usernameNode,
                                  label: tr('auth_screen.asking_for_username'),
                                  onValidate: nameValidator,
                                  onSubmit: (value) {
                                    authBloc.add(
                                      HasEnterValue(
                                        text: value,
                                        isPassword: false,
                                        isConfirmationPassword: false,
                                      ),
                                    );
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(authBloc.passwordNode);
                                  },
                                ),

                                EmptySpace.sizeH40,

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    tr('auth_screen.password'),
                                    style: TextStyles.lato40018,
                                  ),
                                ),

                                EmptySpace.sizeH8,

                                AuthTextfield(
                                  focusNode: authBloc.passwordNode,
                                  label: tr('auth_screen.asking_for_password'),
                                  isPassword: true,
                                  onValidate: validatePassword,
                                  onSubmit: (value) {
                                    authBloc.add(
                                      HasEnterValue(
                                        text: value,
                                        isPassword: true,
                                        isConfirmationPassword: false,
                                      ),
                                    );
                                    FocusScope.of(context).requestFocus(
                                      authBloc.confirmationPasswordNode,
                                    );
                                  },
                                ),

                                EmptySpace.sizeH40,

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    tr('auth_screen.confirm_password'),
                                    style: TextStyles.lato40018,
                                  ),
                                ),

                                EmptySpace.sizeH8,

                                AuthTextfield(
                                  focusNode: authBloc.confirmationPasswordNode,
                                  label: tr(
                                    'auth_screen.asking_to_confirming_password',
                                  ),
                                  isPassword: true,
                                  onValidate: (value) {
                                    if (value != null &&
                                        value !=
                                            authBloc.passwordController.text) {
                                      return 'Please ensure both passwords are identical';
                                    }
                                    return null;
                                  },
                                  onSubmit: (value) {
                                    authBloc.add(
                                      HasEnterValue(
                                        text: value,
                                        isPassword: true,
                                        isConfirmationPassword: true,
                                      ),
                                    );

                                    final firstField = authBloc
                                        .passwordController
                                        .text
                                        .isNotEmpty;
                                    final secondField = authBloc
                                        .passwordController
                                        .text
                                        .isNotEmpty;

                                    if (firstField && secondField) {
                                      authBloc.add(
                                        HasEnterAllFields(
                                          isFilledAllFields: true,
                                        ),
                                      );
                                    }
                                  },
                                ),

                                EmptySpace.sizeH56,

                                BlocBuilder<AuthBloc, AuthState>(
                                  builder: (context, state) {
                                    return AppCustomButton(
                                      label: tr('auth_screen.register'),
                                      onPressed: authBloc.isFilledAllFields
                                          ? () {
                                              if (authBloc.formKey.currentState!
                                                  .validate()) {
                                                print('----');
                                                authBloc.add(
                                                  SignUpEvent(
                                                    username: authBloc
                                                        .usernameController
                                                        .text,
                                                    password: authBloc
                                                        .passwordController
                                                        .text,
                                                  ),
                                                );
                                              }
                                            }
                                          : null,
                                    );
                                  },
                                ),

                                EmptySpace.sizeH32,

                                InkWell(
                                  onTap: () => context.goToWithReplacement(
                                    screen: LoginScreen(),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      text:
                                          '${tr('auth_screen.not_have_account')}  ',
                                      style: TextStyles.lato40014,
                                      children: [
                                        TextSpan(
                                          text: tr('auth_screen.register'),
                                          style: TextStyles.lato40018.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
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
            ),
          );
        },
      ),
    );
  }
}
