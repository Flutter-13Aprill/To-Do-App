import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getit/Styles/colors.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;

  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("RegisterScreen.usernameLabel"),
          style: TextStyle(
            color: mainText,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onTapOutside: (event) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.tr("RegisterScreen.usernameValidationError");
            }
            // Add more validation logic if needed
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(Icons.email_outlined, color: mainText),

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
  }
}
