import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_app/Theme/app_colors.dart';

class CircleDot extends StatelessWidget {
  const CircleDot({super.key, this.isActive = false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    log("$isActive");
    return Container(
      width:  27,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
      
        color: isActive ? AppColors.textHint : AppColors.border,
      ),
    );
  }
}
