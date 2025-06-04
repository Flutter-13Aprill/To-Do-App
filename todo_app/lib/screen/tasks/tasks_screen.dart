import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/screen/home/bloc/home_bloc.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_main_text.dart';
import 'package:todo_app/widget/custom_task.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          if (state is TaskAddedSuccessState && state.tasks.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return CustomTask(
                  titleTask: task.title,
                  subTitleTask: task.dateTime.toString(),
                  isSelected: true,
                  textPrio: '${task.priority}',
                  onChanged: (value) {},
                );
              },
            );
          } else if (state is TaskAddedSuccessState && state.tasks.isEmpty) {
            return Center(
              child: CustomMainText(
                text: 'No tasks added yet.',
                color: ColorsApp.white,
                fontSize: 18,
              ),
            );
          } else if (state is TaskErrorState) {
            return Center(
              child: CustomMainText(
                text: 'Error: ${state.message}',
                color: Colors.red,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: ColorsApp.primary),
            );
          }
        },
      ),
    );
  }
}

// CustomMainText(
//           text: 'No tasks added yet.',
//           color: ColorsApp.white,
//           fontSize: 18,
//         ),
//  ListView.separated(
//               padding: EdgeInsets.all(16),
//               itemCount: tasks.length,
//               separatorBuilder: (context, index) => SizedBox(height: 12),
//               itemBuilder: (context, index) {
//                 final task = tasks[index];
//                 return ListTile(
//                   tileColor: ColorsApp.cardColors,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   title: Text(
//                     task.title,
//                     style: TextStyle(
//                       color: ColorsApp.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete, color: ColorsApp.primary),
//                     onPressed: () {
//                       // bloc.add(DeleteTaskEvent(task.id));
//                     },
//                   ),
//                 );
//               },
//             );
