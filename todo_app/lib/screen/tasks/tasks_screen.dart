import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/screen/home/bloc/home_bloc.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_main_text.dart';

class TasksScreen extends StatelessWidget {
  final HomeBloc homeBloc;

  const TasksScreen({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomeBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<HomeBloc>();

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/sort.svg',
                  height: 24,
                  width: 24,
                ),
              ),
              title: CustomMainText(color: ColorsApp.white, text: 'Index'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/persona.png'),
                    radius: 18,
                  ),
                ),
              ],
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial) {
                  bloc.add(LodTasksEvent());
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is TasksLoadedState) {
                  final tasks = state.tasks;
                  if (tasks.isEmpty) {
                    return Center(
                      child: CustomMainText(
                        text: 'No tasks added yet.',
                        color: ColorsApp.white,
                        fontSize: 18,
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemCount: tasks.length,
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ListTile(
                        tileColor: ColorsApp.cardColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            color: ColorsApp.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: ColorsApp.primary),
                          onPressed: () {
                            // bloc.add(DeleteTaskEvent(task.id));
                          },
                        ),
                      );
                    },
                  );
                } else if (state is HomeInitial) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TaskAddedErrorState) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}
