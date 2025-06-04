import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/screens/home/bloc/home_bloc.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:intl/intl.dart';

class TasksContainer extends StatelessWidget {
  const TasksContainer({
    super.key,
    required this.setIcon,
    required this.setTask,
    this.setTime,
    required this.setCatagory,
    required this.setPriority,
    required this.setColors,
    required this.date,
  });

  final String setIcon;
  final String setTask;
  final TimeOfDay? setTime;
  final DateTime date;
  final Color setColors;
  final String setCatagory;
  final String setPriority;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors().alertBackgroundColor,
      width: 327.w,
      height: 72.h,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final bloc = context.read<HomeBloc>();
              return Checkbox(
                value: bloc.isChecked,
                onChanged: (value) {
                  bloc.add(CheckEvent());
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
          Container(
            width: 150,
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(setTask, style: context.bodyM()),
                Text(
                  '${DateFormat.MMMd().format(date)} ${setTime!.format(context).toString()}',
                  style: context.bodyM()!.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            width: 150.w,
            height: 60.h,
            child: Row(
              spacing: 16,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: setColors,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: 87.w,
                  height: 29.h,
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(setIcon, scale: 2),
                      Text(setCatagory, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 134, 135, 231),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: 42.w,
                  height: 29.h,
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/flag.png', scale: 2),
                      Text(setPriority, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
