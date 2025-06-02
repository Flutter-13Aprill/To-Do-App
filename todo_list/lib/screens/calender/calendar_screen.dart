import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/screens/calender/bloc/calendar_bloc.dart';
import 'package:todo_list/style/app_colors.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  List<DateTime> getDaysInMonth(DateTime date) {
    final lastDay = DateTime(date.year, date.month + 1, 0);
    return List.generate(
      lastDay.day,
      (index) => DateTime(date.year, date.month, index + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarBloc(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: BlocBuilder<CalendarBloc, CalendarState>(
            builder: (context, state) {
              DateTime selectedDate;

              if (state is CalendarSuccess) {
                selectedDate = state.selectedDate;
              } else {
                selectedDate = DateTime.now();
              }

              final days = getDaysInMonth(selectedDate);

              return Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                    color: AppColors.darkGray,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                              ),
                              onPressed:
                                  () => context.read<CalendarBloc>().add(
                                    ChangeMonth(false),
                                  ),
                            ),
                            Text(
                              DateFormat('MMMM yyyy').format(selectedDate),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                              onPressed:
                                  () => context.read<CalendarBloc>().add(
                                    ChangeMonth(true),
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 90,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: days.length,
                            itemBuilder: (context, index) {
                              final date = days[index];
                              final isSelected = date.day == selectedDate.day;
                              final isSunday = date.weekday == DateTime.sunday;

                              return GestureDetector(
                                onTap:
                                    () => context.read<CalendarBloc>().add(
                                      SelectDate(date),
                                    ),
                                child: Container(
                                  width: 60,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? AppColors.lightPurole
                                            : AppColors.ultraDarkGray,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat(
                                          'EEE',
                                        ).format(date).toUpperCase(),
                                        style: TextStyle(
                                          color:
                                              isSunday
                                                  ? Colors.red
                                                  : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        date.day.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Colors.white70,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      if (isSelected)
                                        const CircleAvatar(
                                          radius: 2,
                                          backgroundColor:
                                              Colors.deepPurpleAccent,
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
