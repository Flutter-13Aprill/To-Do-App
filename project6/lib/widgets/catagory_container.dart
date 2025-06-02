import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';

class CatagoryContainer extends StatelessWidget {
  const CatagoryContainer({
    super.key,
    required this.setCatagory,
    required this.setImage,
    required this.setColor,
    this.onTap,
  });

  final String setCatagory;
  final String setImage;
  final Color setColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64.w,
        height: 90.h,

        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: setColor,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              width: 64.w,
              height: 64.h,
              child: Image.asset(setImage),
            ),

            Text(setCatagory, style: context.bodyM()),
          ],
        ),
      ),
    );
  }
}
