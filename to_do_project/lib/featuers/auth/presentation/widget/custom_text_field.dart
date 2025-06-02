import 'package:flutter/material.dart';
import 'package:to_do_project/core/theme/app_palete.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controllere;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controllere,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllere,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(151, 151, 151, 0.135),
        label: Text(hintText, style: const TextStyle(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPalete.text, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPalete.text, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),

        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
