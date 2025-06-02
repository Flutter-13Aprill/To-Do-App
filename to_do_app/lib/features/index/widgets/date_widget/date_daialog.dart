import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/index/widgets/date_widget/bloc/calendar_bloc.dart';
import 'package:to_do_app/features/index/widgets/date_widget/calander_content.dart';

class CalendarDialog {
  static Future<DateTime?> show(BuildContext context) async {
    DateTime? selectedDateTime;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        final calendarBloc = context.read<CalendarBloc>();
        return BlocProvider.value(
          value: calendarBloc,
          child: CalendarContent(
            onDateTimeSelected: (dateTime) {
              selectedDateTime = dateTime;
            },
          ),
        );
      },
    );

    return selectedDateTime;
  }
}
