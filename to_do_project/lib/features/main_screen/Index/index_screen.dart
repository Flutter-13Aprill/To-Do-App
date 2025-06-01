import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_project/features/main_screen/Index/add_task_buttom_sheet.dart';
import 'package:to_do_project/features/main_screen/Index/bloc/task_bloc.dart';
import 'package:to_do_project/features/main_screen/Index/bloc/task_state.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final tasks = state.tasks;

        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: tasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Image.asset('assets/images/Checklist-rafiki 1.png'),
                        const SizedBox(height: 20),
                        const Text(
                          "What do you want to do today?",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Text(
                          "Tap + to add your tasks",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF363636),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            task.title,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            "Today At ${task.time}",
                            style: const TextStyle(color: Colors.white60),
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white24),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "🏁 ${task.priority}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF8875FF),
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => BlocProvider.value(
                  value: context.read<TaskBloc>(),
                  child: const AddTaskBottomSheet(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
