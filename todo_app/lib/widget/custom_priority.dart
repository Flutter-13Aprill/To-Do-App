import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/theme/colors_app.dart';

class CustomPriority extends StatelessWidget {
  final String text;
  final bool isSelected;
  const CustomPriority({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 75,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isSelected ? ColorsApp.primary : ColorsApp.text,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsApp.primary),
      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),

        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset('assets/icons/flag.svg', height: 24, width: 24),
            SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsApp.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
