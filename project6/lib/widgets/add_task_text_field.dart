import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskTextField extends StatelessWidget {
  const AddTaskTextField({super.key, required this.setHint,this.controller});

  final String setHint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400..w,
      height: 48.h,

      child: TextFormField(controller: controller,
        style: TextStyle(color: Colors.white),

        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          hintText: setHint,
        ),
      ),
    );
  }
}
