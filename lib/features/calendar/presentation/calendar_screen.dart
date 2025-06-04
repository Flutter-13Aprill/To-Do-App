import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:uptodo/features/calendar/presentation/widgets/Calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('calendar_screen.app_bar_title'))),
      body: Column(
        children: [

          Calendar()
        ],
      ),
    );
  }
}
