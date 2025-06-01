import 'package:app/extension/Screen/get_size_screen.dart';
import 'package:app/theme/style_color.dart';
import 'package:flutter/material.dart';

class LinearConatiner extends StatelessWidget {
  const LinearConatiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: context.getWidth() * .5,
      height: context.getHeigth() * .005,
      decoration: BoxDecoration(color: StyleColor.primaryWhitelColor),
    );
  }
}
