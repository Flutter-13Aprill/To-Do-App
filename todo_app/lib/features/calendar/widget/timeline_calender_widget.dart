import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/style/style_color.dart';

/// A widget displaying a customizable horizontal date timeline with month header and background.
class TimelineCalendarWidget extends StatelessWidget {
  const TimelineCalendarWidget({super.key, required this.onDateChanged});
  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StyleColor.grey,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          onDateChanged(selectedDate);
        },
        headerProps: EasyHeaderProps(
          showHeader: true,

          dateFormatter: DateFormatter.custom('yyyy'),
          monthPickerType: MonthPickerType.switcher,
          centerHeader: true,
        ),
        dayProps: EasyDayProps(
          inactiveDayStyle: DayStyle(
            dayStrStyle: TextStyle(color: Colors.white),
            dayNumStyle: TextStyle(color: Colors.white),
          ),
          dayStructure: DayStructure.dayStrDayNum,
          activeDayStyle: DayStyle(
            dayStrStyle: TextStyle(color: Colors.white),
            dayNumStyle: TextStyle(color: Colors.white),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: StyleColor.purple,
            ),
          ),
        ),
      ),
    );
  }
}
