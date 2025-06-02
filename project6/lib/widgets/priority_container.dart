import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';

class PriorityContainer extends StatelessWidget {
  const PriorityContainer({super.key, required this.priorityNumber});

  final String priorityNumber;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      height: 64.h,
      color: const Color.fromARGB(255, 39, 39, 39),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/flag.png'),
          SizedBox(height: 6.h),
          Text(priorityNumber, style: context.bodyM()),
        ],
      ),
    );
  }
}
