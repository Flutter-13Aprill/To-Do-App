import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_development/Models/Task_model.dart';

import 'package:to_do_app_development/Screen/Task/bloc/task_bloc.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_event.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_state.dart';

import 'package:to_do_app_development/Screen/Task_Screen.dart';
import 'package:to_do_app_development/Widget/Add_Task_Dialog.dart';
import 'package:to_do_app_development/Widget/Custom_Menu_Icon.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          backgroundColor: const Color(0xFF121212),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Index',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          leading: IconButton(icon: const CustomMenuIcon(), onPressed: () {}),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('assets/Profile.png'),
              ),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(16),
            child: SizedBox(height: 16),
          ),
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskInitial) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 227,
                      height: 227,
                      child: Image.asset(
                        'assets/empty_tasks.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "What do you want to do today?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Tap + to add your tasks",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              );
            }

            if (state is TaskLoadSuccess) {
              if (state.filteredTasks.isEmpty) {
                return const Center(
                  child: Text(
                    'No tasks added yet.',
                    style: TextStyle(color: Colors.white70),
                  ),
                );
              }

              final bloc = context.read<TaskBloc>();

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for your task...',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white54,
                        ),
                        filled: true,
                        fillColor: Colors.grey[900],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: const TextStyle(color: Colors.white54),
                      ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        bloc.add(SearchTaskEvent(value));
                      },
                    ),
                    const SizedBox(height: 100),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.filteredTasks.length,
                        itemBuilder: (context, index) {
                          final task = state.filteredTasks[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                6,
                              ), // Rounded corners
                            ),
                            color: const Color(0xFF363636),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final result = await Navigator.of(
                                        context,
                                      ).push<dynamic>(
                                        MaterialPageRoute(
                                          builder:
                                              (context) => TaskScreen(
                                                task: task,
                                                index: index,
                                              ),
                                        ),
                                      );

                                      if (result is Task) {
                                        context.read<TaskBloc>().add(
                                          EditTaskEvent(
                                            index: index,
                                            updatedTask: result,
                                          ),
                                        );
                                      } else if (result == 'delete') {
                                        context.read<TaskBloc>().add(
                                          DeleteTaskEvent(index),
                                        );
                                      }
                                    },

                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white54,
                                          width: 2,
                                        ),
                                        color: Colors.transparent,
                                      ),
                                      child:
                                          task.isCompleted
                                              ? const Icon(
                                                Icons.check,
                                                size: 20,
                                                color: Colors.white,
                                              )
                                              : null,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          task.title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            // Date display
                                            Text(
                                              () {
                                                if (task.dueDate != null) {
                                                  final now = DateTime.now();
                                                  final due = DateTime(
                                                    task.dueDate!.year,
                                                    task.dueDate!.month,
                                                    task.dueDate!.day,
                                                  );
                                                  final today = DateTime(
                                                    now.year,
                                                    now.month,
                                                    now.day,
                                                  );
                                                  final tomorrow = today.add(
                                                    const Duration(days: 1),
                                                  );
                                                  if (due == today) {
                                                    return "Today At";
                                                  } else if (due == tomorrow) {
                                                    return "Tomorrow At";
                                                  } else {
                                                    return "${task.dueDate!.day}/${task.dueDate!.month}/${task.dueDate!.year}";
                                                  }
                                                } else {
                                                  return "No date set";
                                                }
                                              }(),
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 14,
                                              ),
                                            ),
                                            if (task.dueTime != null) ...[
                                              SizedBox(width: 6),
                                              Text(
                                                task.dueTime!.format(context),
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    width: 16,
                                  ), // Added spacing between elements
                                  // Category Display
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: task.category.color.withOpacity(
                                        0.3,
                                      ), // More visible background
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          task.category.icon,
                                          color: task.category.color,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          task.category.name,
                                          style: TextStyle(
                                            color: task.category.color,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  // Priority Display
                                  Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1D1D1D),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xFF8687E7),
                                        width: 1.5,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.flag_outlined,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          "${task.priority.index + 1}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 2,
                                                color: Colors.black54,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
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
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              backgroundColor: const Color(0xFF8687E7),
              onPressed: () async {
                final task = await showDialog<Task>(
                  context: context,
                  builder: (_) => AddTaskDialog(),
                );
                if (task != null) {
                  context.read<TaskBloc>().add(AddTaskEvent(task));
                }
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            );
          },
        ),
      ),
    );
  }
}
