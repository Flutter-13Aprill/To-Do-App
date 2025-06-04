import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_development/Models/Task_model.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_bloc.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_event.dart';
import 'package:to_do_app_development/Screen/Task/bloc/task_state.dart';
import 'package:to_do_app_development/Screen/Task_Screen.dart';
import 'package:to_do_app_development/Screen/profile/cubit/image_cubit.dart';
import 'package:to_do_app_development/Widget/Add_Task_Dialog.dart';
import 'package:to_do_app_development/Widget/Custom_Menu_Icon.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'index'.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        leading: IconButton(icon: const CustomMenuIcon(), onPressed: () {}),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: BlocBuilder<ProfileImageCubit, File?>(
              builder: (context, state) {
                return CircleAvatar(
                  radius: 32,
                  backgroundImage:
                      state != null
                          ? FileImage(state)
                          : const AssetImage('assets/Profile.png')
                              as ImageProvider,
                );
              },
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(16),
          child: SizedBox(height: 16),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoadSuccess) {
              final todayTasks =
                  state.filteredTasks
                      .where(
                        (task) =>
                            !task.isCompleted &&
                            task.dueDate != null &&
                            DateUtils.isSameDay(task.dueDate, DateTime.now()),
                      )
                      .toList();
        
              final completedTasks =
                  state.filteredTasks.where((task) => task.isCompleted).toList();
        
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildSearchBar(taskBloc),
                    const SizedBox(height: 16),
        
                    _buildSectionTitle('today'.tr()),
                    _buildTaskList(
                      context,
                      todayTasks,
                      taskBloc,
                      isCompletedList: false,
                    ),
        
                    const SizedBox(height: 16),
                    _buildSectionTitle('completed'.tr()),
                    _buildTaskList(
                      context,
                      completedTasks,
                      taskBloc,
                      isCompletedList: true,
                    ),
                  ],
                ),
              );
            }
        
            if (state is TaskInitial) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200),
                    SizedBox(
                      width: 227,
                      height: 227,
                      child: Image.asset('assets/empty_tasks.png'),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "what_to_do_today".tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "tap_to_add".tr(),
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              );
            }
        
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8687E7),
        onPressed: () async {
          final task = await showDialog<Task>(
            context: context,
            builder: (_) => AddTaskDialog(),
          );
          if (task != null) {
            taskBloc.add(AddTaskEvent(task));
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(44)),
      ),
    );
  }

  Widget _buildSearchBar(TaskBloc taskBloc) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'search_hint'.tr(),
        prefixIcon: const Icon(Icons.search, color: Colors.white54),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: Colors.white54),
      ),
      style: const TextStyle(color: Colors.white),
      onChanged: (value) => taskBloc.add(SearchTaskEvent(value)),
    );
  }

  Widget _buildSectionTitle(String title) {
    final arabicRegex = RegExp(r'^[\u0600-\u06FF]');
    final isArabic = title.isNotEmpty && arabicRegex.hasMatch(title[0]);
    final effectiveAlign = isArabic ? Alignment.centerRight : Alignment.centerLeft;

    return Align(
      alignment: effectiveAlign,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList(
    BuildContext context,
    List<Task> tasks,
    TaskBloc taskBloc, {
    required bool isCompletedList,
  }) {
    return tasks.isEmpty
        ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "no_tasks".tr(),
            style: const TextStyle(color: Colors.white54),
          ),
        )
        : ListView.builder(
          shrinkWrap: true,
          physics:  NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: const Color(0xFF363636),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isCompletedList)
                      GestureDetector(
                        onTap: () async {
                          final result = await Navigator.of(
                            context,
                          ).push<dynamic>(
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      TaskScreen(task: task, index: index),
                            ),
                          );

                          if (result is Task) {
                            taskBloc.add(
                              EditTaskEvent(index: index, updatedTask: result),
                            );
                          } else if (result == 'delete') {
                            taskBloc.add(DeleteTaskEvent(index));
                          }
                        },
                        child: Container(
                          width: 14,
                          height: 14,
                          margin: const EdgeInsets.only(right: 20, top: 4,left: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white54, width: 2),
                          ),
                        ),
                      ),

                    // Main Task Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              letterSpacing: 0.3,
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Date and Time
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.white54,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
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
                                    if (due == today) return 'today_at'.tr();
                                    if (due == tomorrow)
                                      return 'tomorrow_at'.tr();
                                    return "${task.dueDate!.day}/${task.dueDate!.month}/${task.dueDate!.year}";
                                  }
                                  return 'no_date'.tr();
                                }(),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                              if (task.dueTime != null) ...[
                                const SizedBox(width: 12),
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.white54,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  task.dueTime!.format(context),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Bottom Row: Category + Priority
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(), // Spacer
                              Row(
                                children: [
                                  _buildCategoryTag(task),
                                  const SizedBox(width: 8),
                                  _buildPriorityBox(task),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }

  Widget _buildCategoryTag(Task task) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: task.category.color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(task.category.icon, color: task.category.color, size: 18),
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
    );
  }

  Widget _buildPriorityBox(Task task) {
    return Container(
      width: 60,
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF8687E7), width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.flag_outlined, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Text(
            "${task.priority.index + 1}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
