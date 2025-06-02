import 'package:flutter/material.dart';
import 'package:todo_app/features/index/widget/buttons_widget.dart';
import 'package:todo_app/features/index/widget/calendar_widget.dart';
import 'package:todo_app/features/index/widget/time_picker_widget.dart';
import 'package:todo_app/style/style_color.dart';

/// Displays a custom calendar dialog that allows the user to pick a date.
showCalendarDialog(context) {
  showDialog(
    context: context,
    builder:
        (BuildContext context) => Dialog(
          backgroundColor: StyleColor.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 400,
              child: Column(
                children: [
                  Expanded(child: CalendarWidget()),
                  ButtonsWidget(
                    text: 'Choose Time',
                    onPressedNext: () {
                      showDialog(
                        context: context,
                        builder:
                            (BuildContext context) => Dialog(
                              backgroundColor: StyleColor.grey,
                              child: SizedBox(
                                height: 300,
                                child: TimePickerWidget(),
                              ),
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
