import 'package:flutter/material.dart';
import 'package:to_do_project/core/text/text_style.dart';
import 'package:to_do_project/featuers/calender/presentation/widget/custom_calender.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calendar",
          style: TextStyles.lato400s16.copyWith(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          DateTimePickerDialogButton(
            onDateTimeSelected: (dateTime) {
              print(" $dateTime");
            },
          ),
        ],
      ),
    );
  }
}
