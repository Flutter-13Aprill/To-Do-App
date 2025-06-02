import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:to_do_app/features/index/widgets/categories_widgets/bloc/categories_bloc.dart';
import 'package:to_do_app/features/index/widgets/custom_dialog.dart';
import 'package:to_do_app/features/index/widgets/date_widget/bloc/calendar_bloc.dart';
import 'package:to_do_app/features/index/widgets/priority/bloc/priority_bloc.dart';
import 'package:to_do_app/features/index/bloc/task_bloc.dart';
import 'package:to_do_app/features/utilts/services/TaskService.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CalendarBloc()),
        BlocProvider(create: (_) => TaskBloc(TaskService())..add(LoadTasksEvent())),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/sort.png'),
              ),
              centerTitle: true,
              title: Text(
                'Index',
                style: TextStyle(fontSize: context.getShortest(per: 0.4)),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.fill,
                    width: context.getShortest(per: 1),
                    height: context.getShortest(per: 1),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.getShortest(per: 1),
                  vertical: context.getShortest(per: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Expanded(
  child: BlocBuilder<TaskBloc, TaskState>(
    builder: (context, state) {
      if (state is TaskLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is TaskLoaded) {
        if (state.tasks.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/indexpage.png'),
              const SizedBox(height: 16),
              Text(
                'What do you want to do today?',
                style: TextStyle(fontSize: context.getShortest(per: 0.5)),
              ),
              Text(
                'Tap + to add your tasks',
                style: TextStyle(fontSize: context.getShortest(per: 0.4)),
              ),
            ],
          );
        }
        return ListView.builder(
          itemCount: state.tasks.length,
          itemBuilder: (context, index) {
            final task = state.tasks[index];
            return ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(task.title),
              subtitle: Text(task.description ?? 'no discrption'),
              trailing: task.dueDate != null
                  ? Text(
                      '${task.dueDate!.day}/${task.dueDate!.month}/${task.dueDate!.year}',
                      style: const TextStyle(color: Colors.grey),
                    )
                  : null,
            );
          },
        );
      } else if (state is TaskError) {
        return Center(child: Text(state.message));
      }
      return const SizedBox();
    },
  ),
),

                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                final calendarBloc = BlocProvider.of<CalendarBloc>(context);
                showDialog(
                  context: context,
                  builder: (dialogContext) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: calendarBloc),
                      BlocProvider(create: (_) => CategoriesBloc()),
                      BlocProvider(create: (_) => PriorityBloc()),
                    ],
                    child:  AddTaskDialog(),
                  ),
                );
              },
              backgroundColor: AppPalette.purble,
              child: Icon(
                Icons.add_sharp,
                size: context.getShortest(per: 1),
                color: AppPalette.textColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
