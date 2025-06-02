import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/calendar/widget/timeline_calender_widget.dart';
import 'package:todo_app/style/style_text.dart';

/// The main screen displaying the calendar view.
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("calendar".tr(), style: StyleText.latoBold20)),

      body: Column(children: [TimelineCalendarWidget()]),
    );
  }
}
