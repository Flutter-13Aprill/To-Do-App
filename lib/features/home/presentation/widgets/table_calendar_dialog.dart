import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo/core/extensions/navigation_extensions.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/home/logic/bloc/tasks_bloc.dart';

// ignore: must_be_immutable
class TableCalendarDialog extends StatelessWidget {
  const TableCalendarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {

        final tasksBloc = context.read<TasksBloc>();

        return Dialog(
          child: Container(
            height: context.getHeight(multiplied: 0.45),
            color: AppPalette.primaryBackgroundColor,
            child: Column(
              children: [
                TableCalendar(
                  selectedDayPredicate: (day) =>isSameDay(tasksBloc.selectedDate, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    tasksBloc.selectedDate = selectedDay;
                    tasksBloc.add(SelectedDateEvent());
                  },
                  focusedDay: tasksBloc.selectedDate,
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2030, 12, 31),
                  rowHeight: 50,

                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    leftChevronIcon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                    ),
                    rightChevronIcon: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                    titleTextStyle: TextStyles.lato40014.copyWith(
                      color: Colors.white,
                    ),
                    titleTextFormatter: (date, locale) {
                      return '${DateFormat.MMMM(locale).format(date)}\n${DateFormat.y(locale).format(date)}';
                    },
                  ),
                  calendarStyle: CalendarStyle(
                    defaultDecoration: BoxDecoration(
                      color: AppPalette.chipsBackgroundColor,
                      borderRadius: BorderRadius.circular(6),
                    ),

                    selectedDecoration: BoxDecoration(
                      color: AppPalette.textBottomColor,
                      borderRadius: BorderRadius.circular(6),
                    ),

                    todayDecoration: BoxDecoration(
                      color: AppPalette.chipsBackgroundColor,
                      borderRadius: BorderRadius.circular(6),
                    ),

                    weekendDecoration: BoxDecoration(
                      color: AppPalette.chipsBackgroundColor,
                      borderRadius: BorderRadius.circular(6),
                    ),

                    weekendTextStyle: TextStyle(color: Colors.white),

                    todayTextStyle: TextStyles.lato40014.copyWith(
                      color: Colors.white,
                    ),

                    selectedTextStyle: TextStyles.lato40014.copyWith(
                      color: Colors.white,
                    ),

                    defaultTextStyle: TextStyle(color: Colors.white),
                  ),

                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ), // Saturday and Sunday
                    weekdayStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ), // Monday to Friday
                  ),
                ),

                EmptySpace.sizeH24,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    TextButton(
                      onPressed: () => context.pop(), 
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none
                        )
                      ),
                      child: Text('Cancel', style: TextStyles.lato40018.copyWith(color: AppPalette.primaryBackgroundButtonColor),)
                    ),

                    ElevatedButton(
                      onPressed: (){
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(160, 40)
                      ), 
                      child: Text('Select Date')
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
