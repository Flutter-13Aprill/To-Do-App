import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';
import 'package:todo_list/screens/index/bloc/index_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';

class TimeDialogWidget extends StatelessWidget {
  const TimeDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime tempTime = DateTime.now();

    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        'choose_time'.tr(),
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            Divider(thickness: 1, color: AppColors.mediumGray),
            Expanded(
              child: TimePickerSpinner(
                time: DateTime.now(),
                is24HourMode: false,
                normalTextStyle: TextStyle(fontSize: 18, color: Colors.white54),
                highlightedTextStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                spacing: 40,
                itemHeight: 60,
                isForce2Digits: true,
                onTimeChange: (time) {
                  tempTime = time;
                  print("Selected time: $tempTime");
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.getWidth(factor: 0.34),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "cancel".tr(),
                  style: TextStyle(color: AppColors.lightPurole),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightPurole,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(context.getWidth(factor: 0.34), 48),
              ),
              onPressed: () {
                final selectedTime = TimeOfDay.fromDateTime(tempTime);
                print("Selected time saved: $selectedTime");
                context.read<IndexBloc>().add(TimeSelectedEvent(selectedTime));
                Navigator.of(context).pop();
              },
              child: Text("save".tr(), style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}
