import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/priority_container.dart';

class PriortyAlert extends StatelessWidget {
  const PriortyAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: 327.w,
        height: 360.h,
        color: AppColors().alertBackgroundColor,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              Text(
                'Task Priority',
                style: context.bodyM()!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 310.w,
                child: Divider(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(height: 8.h),

              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 8,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 8,
                  crossAxisCount: 4,
                  children: [
                    ...List.generate(
                      10,
                      (index) => PriorityContainer(
                        priorityNumber: (index + 1).toString(),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
