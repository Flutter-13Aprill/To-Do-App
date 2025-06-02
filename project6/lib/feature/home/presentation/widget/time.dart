import 'package:cupertino_calendar_picker/cupertino_calendar_picker.dart';
import 'package:flutter/material.dart';

class Time {
  static Future<DateTime?> onCalendarWidgetTap(BuildContext context) async {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final nowDate = DateTime.now();

    return showCupertinoCalendarPicker(
      context,
      widgetRenderBox: renderBox,
      minimumDateTime: nowDate.subtract(const Duration(days: 15)),
      initialDateTime: nowDate,
      maximumDateTime: nowDate.add(const Duration(days: 360)),
      mode: CupertinoCalendarMode.dateTime,
      timeLabel: 'Ends',
      onDateTimeChanged: (dateTime) {},
    );
  }
}
