import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/calendar/bloc/calendar_bloc.dart';
import 'package:todo_app/features/calendar/widget/timeline_calender_widget.dart';
import 'package:todo_app/style/style_color.dart';
import 'package:todo_app/style/style_text.dart';

/// The main screen displaying the calendar view.
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc()..add(LoadCalendarDataEvent()),
      child: Builder(
        builder: (context) {
          final bloc = context.read<CalendarBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text("calendar".tr(), style: StyleText.latoBold20),
            ),

            body: BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ErrorState) {
                  return Center(child: Text("error_loading_data".tr()));
                }
                if (state is SuccessState) {
                  final tasksForSelectedDate =
                      state.tasks.where((task) {
                        final taskDate = task.taskTime;
                        if (taskDate == null) return false;
                        return taskDate.year == bloc.selectedDate.year &&
                            taskDate.month == bloc.selectedDate.month &&
                            taskDate.day == bloc.selectedDate.day;
                      }).toList();
                  return Column(
                    children: [
                      TimelineCalendarWidget(
                        onDateChanged: (DateTime value) {
                          bloc.selectedDate = value;
                          bloc.add(UpdateSelectedDateEvent());
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: tasksForSelectedDate.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: StyleColor.grey,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ListTile(
                                        leading: Checkbox(
                                          value:
                                              tasksForSelectedDate[index]
                                                  .isCompleted,
                                          onChanged: (value) {},
                                        ),
                                        title: Text(
                                          tasksForSelectedDate[index].title,
                                        ),
                                        subtitle: Text(
                                          tasksForSelectedDate[index].taskTime
                                              .toString(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          spacing: 8,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // Chip - University
                                            Chip(
                                              avatar: const Icon(
                                                Icons.school,
                                                size: 12,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                state.tasks[index].category
                                                    .toString()
                                                    .tr(),
                                                style: StyleText.latoRegular10,
                                              ),
                                              backgroundColor:
                                                  StyleColor.purple,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),

                                            Chip(
                                              avatar: const Icon(
                                                Icons.flag_outlined,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                              label: Text(
                                                state.tasks[index].priority
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          );
        },
      ),
    );
  }
}
