import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/Models/todo_model.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class EditDialogCalendar extends StatelessWidget {
  const EditDialogCalendar({super.key, required this.todo});
  final ToDoModel todo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        final bloc = context.read<IndexBloc>();
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: containerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: context.screenWidth * 0.8,
                      height: context.screenHeight * 0.4,
                      child: TableCalendar(
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          decoration: BoxDecoration(color: containerColor),
                        ),
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: mainText),
                          weekendStyle: TextStyle(color: errorColor),
                        ),
                        calendarStyle: CalendarStyle(
                          defaultDecoration: BoxDecoration(
                            color: dayColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          weekendDecoration: BoxDecoration(
                            color: dayColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          outsideDecoration: BoxDecoration(
                            color: dayColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          // Customize selected day appearance
                          selectedDecoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          // Customize today's date appearance
                          todayDecoration: BoxDecoration(
                            color: dayColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        selectedDayPredicate: (day) =>
                            isSameDay(day, bloc.selectedDate),
                        onDaySelected: (selected, focusedDay) {
                          bloc.add(DateSelected(selected));
                        },
                        locale: context.locale.toString(),
                        availableGestures: AvailableGestures.all,

                        focusedDay: bloc.selectedDate,
                        firstDay: DateTime.now(),
                        lastDay: DateTime(2100),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            bloc.fullDateTime = DateTime.parse(
                              todo.dueDate,
                            ).toLocal();

                            Navigator.pop(context);
                          },
                          child: Text(
                            context.tr("TaskScreen.cancelButton"),
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              initialEntryMode: TimePickerEntryMode.input,
                              builder: (BuildContext innerContext, Widget? child) {
                                // Optional: customize the theme of the time picker
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    timePickerTheme: TimePickerThemeData(
                                      hourMinuteColor: dayColor,
                                      hourMinuteTextColor: mainText,
                                      backgroundColor: containerColor,
                                      dayPeriodColor: dayColor,
                                      dayPeriodTextColor: mainText,
                                    ),
                                  ),
                                  child: Center(
                                    child: SingleChildScrollView(child: child!),
                                  ),
                                );
                              },
                            );

                            bloc.fullDateTime = DateTime(
                              bloc.selectedDate.year,
                              bloc.selectedDate.month,
                              bloc.selectedDate.day,
                              pickedTime?.hour ?? 0,
                              pickedTime?.minute ?? 0,
                            );

                            bloc.add(RefreshScreen(context));
                          },
                          child: Text(
                            context.tr("TaskScreen.editTaskButton"),
                            style: TextStyle(color: mainText),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
