import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/home/bloc/home_bloc.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/scroll_time_picker_wheel.dart';

class TimerAlert extends StatelessWidget {
  const TimerAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final bloc = context.read<HomeBloc>();
          return Container(
            width: 327.w,
            height: 206.h,
            color: const Color.fromARGB(255, 54, 54, 54),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Text(
                  'chooseTime'.tr(),
                  style: context.bodyM()!.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 300.w,
                  child: Divider(
                    color: const Color.fromARGB(255, 151, 151, 151),
                  ),
                ),
                BlocProvider.value(
                  value: bloc,
                  child: ScrollTimePickerWheel()
                ),
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
                            print(bloc.date);
                            Navigator.pop(context);
                          },
                          child: Text('cancel'.tr(), style: TextStyle(fontSize: 16)),
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
                          Navigator.pop(context);
                          },
                          //need implementaiont return the time back from ScrollTimePickerWheel() **********************
                          child: Text('save'.tr(), style: context.bodyM()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
