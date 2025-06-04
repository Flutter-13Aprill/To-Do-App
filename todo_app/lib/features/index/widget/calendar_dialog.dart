import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/index/bloc/index_bloc.dart';
import 'package:todo_app/features/index/widget/buttons_widget.dart';
import 'package:todo_app/features/index/widget/calendar_widget.dart';
import 'package:todo_app/features/index/widget/time_picker_widget.dart';
import 'package:todo_app/style/style_color.dart';

/// Displays a custom calendar dialog that allows the user to pick a date.
showCalendarDialog(context, IndexBloc bloc) {
  DateTime? selectedDate;
  DateTime? selectedTime;
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
                  Expanded(
                    child: CalendarWidget(
                      onDaySelected: (DateTime) {
                        selectedDate = DateTime;
                      },
                    ),
                  ),
                  ButtonsWidget(
                    text: "chooseTime".tr(),
                    onPressedNext: () {
                      showDialog(
                        context: context,
                        builder:
                            (BuildContext context) => Dialog(
                              backgroundColor: StyleColor.grey,
                              child: SizedBox(
                                height: 300,
                                child: Column(
                                  children: [
                                    TimePickerWidget(
                                      onTimeChanged: (DateTime) {
                                        selectedTime = DateTime;
                                      },
                                    ),
                                    ButtonsWidget(
                                      text: "save".tr(),
                                      onPressedNext: () {
                                        bloc.day = selectedDate;
                                        bloc.time = selectedTime;
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
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
