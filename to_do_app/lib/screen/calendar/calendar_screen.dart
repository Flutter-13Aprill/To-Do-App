import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/model/task/task_model.dart';
import 'package:to_do_app/screen/index/bloc/index_bloc.dart';
import 'package:to_do_app/style/app_text_styles.dart';
import 'package:to_do_app/widget/calendar/completed_widget.dart';
import 'package:to_do_app/widget/calendar/timeline_calendar.dart';
import 'package:to_do_app/widget/index/task_card.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<IndexBloc>();
          bloc.add(LoadData());

          return SafeArea(
            child: Column(
              children: [
                Text("Calendar", style: AppTextStyles.headerText).tr(),
                SizedBox(height: 16),
                TimelineCalendar(),
                SizedBox(height: 20),
                CompletedWidget(),
                SizedBox(height: 20),

                Column(
                  children: [
                    BlocBuilder<IndexBloc, IndexState>(
                      builder: (context, state) {
                        if (state is SuccessLoad &&
                            bloc.dataLayer.tasks.isNotEmpty) {
                          return Column(
                            children: List.generate(
                              bloc.dataLayer.tasks.length,
                              (index) {
                                TaskModel taskinfo =
                                    bloc.dataLayer.tasks[index];
                                return BlocProvider.value(
                                  value: bloc,
                                  child: TaskCard(
                                    id: taskinfo.id,
                                    desciption: taskinfo.desciption,
                                    task: taskinfo.task,
                                    day: taskinfo.day,
                                    month: taskinfo.month,
                                    year: taskinfo.year,
                                    priority: taskinfo.priority,
                                    isDone: taskinfo.isDone,
                                  ),
                                );
                              },
                            ),
                          );
                        }

                        return Text("");
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
