import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/core/setup_locator.dart';
import 'package:todoapp_darkmode/models/task_model.dart';
import 'package:todoapp_darkmode/screens/home_screens/bloc/home_bloc.dart';
import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';
import 'package:todoapp_darkmode/widgets/addTask/add_task_bottom_sheet.dart';
import 'package:todoapp_darkmode/widgets/addTask/bloc/add_task_bloc.dart';
import 'package:todoapp_darkmode/widgets/addTask/details_page.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (_) => locator<HomeBloc>()..add(LoadTasksEvent()),

      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.darkBackground,
            appBar: AppBar(
              backgroundColor: AppColors.darkBackground,
              leading: IconButton(
                onPressed: () {},
                icon: Image.asset("lib/assets/icons/sort.png"),
              ),
              title: Text("Index", style: AppFonts.fontSizeFive),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("lib/assets/images/homeImages/profile_pic.png"),
                ),
              ],
            ),
          body: Padding(
  padding: const EdgeInsets.all(20),
  child: () {
    if (state is TasksLoaded && state.tasks.isNotEmpty) {
      return _buildTaskList(state.tasks, context);
    } else if (state is TaskDetailsState) {
      return buildTaskDetailsPage(context, state.task); 
    } else if (state is HomeLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return _buildEmptyState();
    }
  }(),
),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (ctx) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: context.read<HomeBloc>()),
                        BlocProvider(create: (_) => AddTaskBloc()),
                      ],
                      child: const AddTaskBottomSheet(),
                    );
                  },
                );
              },
              backgroundColor: AppColors.lilac,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildEmptyState() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("lib/assets/images/homeImages/no_task_pic.png", width: 200),
        const SizedBox(height: 24),
        Text("What do you want to do today?", style: AppFonts.fontSizeTwo.copyWith(color: Colors.white)),
        const SizedBox(height: 8),
        Text("Tap + to add your tasks", style: AppFonts.fontSizeThree.copyWith(color: Colors.white70)),
      ],
    ),
  );
}

Widget _buildTaskList(List<TaskModel> tasks, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: "Search for your task...",
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: const Icon(Icons.search, color: Colors.white54),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(height: 20),
    Expanded(
  child: ListView.builder(
    itemCount: tasks.length,
    itemBuilder: (context, index) {
      final task = tasks[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Scaffold(
                backgroundColor: AppColors.darkBackground,
                body: buildTaskDetailsPage(context, task),
              ),
            ),
          );
        },
        child: _buildTaskCard(task, context),
      );
    },
  ),
),


    ],
  );
}

Widget _buildTaskCard(TaskModel task, BuildContext context) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: 
        
        Row(
          children: [
            const Icon(Icons.radio_button_unchecked, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title, style: const TextStyle(color: Colors.white, fontSize: 24)),
                  const SizedBox(height: 4),
                  Text("Today At ${task.time.format(context)}", style: const TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
         
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: task.categoryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(task.category, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
            const SizedBox(width: 8),
            
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lilac),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Image.asset("lib/assets/images/homeImages/flag.png"),
                  Text(task.priority.toString(), style: const TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(width: 8),
      
            //  DELETE BUTTON
            // IconButton(
            //   icon: const Icon(Icons.delete, color: Colors.red),
            //   onPressed: () {
            //     context.read<HomeBloc>().add(DeleteTaskEvent(task.id!));
            //   },
            // ),
          ],
        ),
      ),
    ],
  );
}

