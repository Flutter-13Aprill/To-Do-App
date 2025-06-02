import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/scroll_time_picker_wheel.dart';

class TimerAlert extends StatelessWidget {
  const TimerAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: 327.w,
        height: 206.h,
        color: const Color.fromARGB(255, 54, 54, 54),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Text(
              'Choose Time',
              style: context.bodyM()!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 300.w,
              child: Divider(color: const Color.fromARGB(255, 151, 151, 151)),
            ),
            ScrollTimePickerWheel(),
            SizedBox(height: 25.h),
            SizedBox(
              width: 315.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 153.w,
                    height: 48.h,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  Container(
                    width: 153.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors().buttonColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(
                      onPressed: () {
                        
                      },
                      //need implementaiont return the time back from ScrollTimePickerWheel() **********************
                      child: Text('Save', style: context.bodyM()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
