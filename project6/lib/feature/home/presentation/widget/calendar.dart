import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();

        return TableCalendar(
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,

            titleTextStyle: TextStyles.lato40014,
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: AppPalette.whiteColor,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: AppPalette.whiteColor,
            ),
          ),
          availableGestures: AvailableGestures.all,
          focusedDay: bloc.today,
          firstDay: DateTime(bloc.today.year),
          lastDay: DateTime(bloc.today.year + 100, 12, 31),
          selectedDayPredicate: (day) => isSameDay(day, bloc.today),
          onDaySelected: (selectedDay, focusedDay) {
            bloc.add(GetDateEvent(day: selectedDay));
          },
        );
      },
    );
  }
}
