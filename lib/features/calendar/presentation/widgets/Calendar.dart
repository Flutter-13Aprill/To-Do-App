import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2030, 12, 31),
      calendarFormat: CalendarFormat.week,
      availableCalendarFormats: {CalendarFormat.week: 'Week'},
      daysOfWeekVisible: false,
      rowHeight: 70,

      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,

        leftChevronIcon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
        rightChevronIcon: Icon(Icons.keyboard_arrow_right, color: Colors.white),
        titleTextStyle: TextStyles.lato40014.copyWith(color: Colors.white),
        titleTextFormatter: (date, locale) {
          return '${DateFormat.MMMM(locale).format(date)}\n${DateFormat.y(locale).format(date)}';
        },
      ),

      calendarStyle: CalendarStyle(
        outsideDaysVisible: true,
        defaultDecoration: BoxDecoration(
          color: AppPalette.chipsBackgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),

        selectedDecoration: BoxDecoration(
          color: AppPalette.textBottomColor,
          borderRadius: BorderRadius.circular(6),
        ),

        todayDecoration: BoxDecoration(
          color: AppPalette.textBottomColor,
          borderRadius: BorderRadius.circular(6),
        ),

        weekendDecoration: BoxDecoration(
          color: AppPalette.chipsBackgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        outsideDecoration: BoxDecoration(
          color: AppPalette.chipsBackgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),

        weekendTextStyle: TextStyle(color: Colors.white),

        todayTextStyle: TextStyles.lato40014.copyWith(color: Colors.white),

        selectedTextStyle: TextStyles.lato40014.copyWith(color: Colors.white),

        defaultTextStyle: TextStyle(color: Colors.white),

        outsideTextStyle: TextStyle(color: Colors.white)
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

      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          final isWeekend =
              day.weekday == DateTime.saturday ||
              day.weekday == DateTime.sunday;

          return Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: context.getWidth(multiplied: 0.14),
            decoration: BoxDecoration(
              color: AppPalette.primaryBackgroundColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat.E().format(day), // Short weekday name, e.g., Mon
                  style: TextStyle(
                    color: isWeekend ? Colors.red : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          );
        },

        selectedBuilder: (context, day, focusedDay) {
          return Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: context.getWidth(multiplied: 0.13),
            decoration: BoxDecoration(
              color: AppPalette.primaryBackgroundColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DateFormat.E().format(day),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          );
        },

        todayBuilder: (context, day, focusedDay) {
          return Container(
            padding: EdgeInsets.all(6),
            width: context.getWidth(multiplied: 0.13),
            decoration: BoxDecoration(
              color: AppPalette.textBottomColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat.E().format(day),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          final isWeekend = day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
          
          return Container(
            padding: EdgeInsets.all(6),
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: context.getWidth(multiplied: 0.14),
              decoration: BoxDecoration(
                color: AppPalette.primaryBackgroundColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(DateFormat.E().format(day), style: TextStyle(color: isWeekend ? Colors.red : Colors.white,fontWeight: FontWeight.bold,fontSize: 12,),),

                  SizedBox(height: 6),

                  Text('${day.day}', style: TextStyle(color: Colors.white,fontSize: 14,),),
                ],
              ),
            );
          },

        ),
    );
  }
}
