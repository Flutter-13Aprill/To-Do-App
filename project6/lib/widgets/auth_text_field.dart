import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.setHint,
    required this.isPassword,
    this.validator, this.onChange, required this.textEditingController,
  });

  final String setHint;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 48.h,
      
      child: TextFormField(onChanged: onChange,
        controller: textEditingController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(filled: true,
          fillColor: Color.fromARGB(255, 32, 32, 32),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          hintText: setHint,
        ),
        // onChanged: onChange,
        obscureText: isPassword,
        validator: validator,
      ),
    );
  }
}
