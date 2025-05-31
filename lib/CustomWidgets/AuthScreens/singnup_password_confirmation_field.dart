import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/Screens/signup/bloc/sign_up_bloc.dart';
import 'package:getit/Styles/colors.dart';

class SingnupPasswordConfirmationField extends StatelessWidget {
  const SingnupPasswordConfirmationField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        var bloc = context.read<SignUpBloc>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("RegisterScreen.confirmPasswordLabel"),
              style: TextStyle(
                color: mainText,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              onTapOutside: (event) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              onChanged: (value) {
                // You can add any additional logic here if needed
                bloc.add(CheckPasswordStrength(value));
              },

              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim() != bloc.passwordController.text.trim()) {
                  return context.tr('RegisterScreen.passwordsDontMatchError');
                }
                // Add more validation logic if needed
                return null;
              },
              controller: controller,
              obscureText: bloc.isPasswordVisible,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(Icons.lock_outline, color: mainText),
                suffixIcon: IconButton(
                  onPressed: () {
                    bloc.add(ObscurePasswordClicked());
                  },
                  icon: Icon(
                    bloc.isPasswordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: mainText,
                  ),
                ),
                filled: true,
                fillColor: textFieldBackground,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
