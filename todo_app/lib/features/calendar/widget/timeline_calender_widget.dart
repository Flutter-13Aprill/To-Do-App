import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/style/style_color.dart';

/// A widget displaying a customizable horizontal date timeline.
class TimelineCalendarWidget extends StatelessWidget {
  const TimelineCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {},
      headerProps: const EasyHeaderProps(
        showHeader: false,
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDMY(),
      ),
      dayProps: const EasyDayProps(
        inactiveDayStyle: DayStyle(dayNumStyle: TextStyle(color: Colors.white)),
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: StyleColor.purple,
          ),
        ),
      ),
    );
  }
}
