import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/models/task_model.dart';
import 'package:todoapp_darkmode/screens/home_screens/bloc/home_bloc.dart' as home_bloc;
import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';
import 'package:todoapp_darkmode/widgets/addTask/custom_datetime_picker.dart';
import 'package:todoapp_darkmode/widgets/addTask/bloc/add_task_bloc.dart';
import 'package:todoapp_darkmode/widgets/addTask/bloc/add_task_state.dart';
import 'package:todoapp_darkmode/widgets/addTask/custom_category_picker.dart';
import 'package:todoapp_darkmode/widgets/addTask/custom_priority_picker.dart';



class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AddTaskState>(
      builder: (context, state) {
        return Container(
           decoration: const BoxDecoration(
    color: AppColors.grey,
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(height: 10,),
                    Text("Add Task", style: AppFonts.fontSizeFive.copyWith(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 16),
          
                // TITLE
              TextField(
  style: const TextStyle(color: Colors.white),
   onChanged: (value) {
    print("📝 Title: $value"); // ✅ Debug print
    context.read<AddTaskBloc>().add(TitleChanged(value));
  },

  decoration: const InputDecoration(
    hintText: "Enter task title",
    hintStyle: TextStyle(color: Colors.white54),
    border: InputBorder.none, // no border by default
    enabledBorder: InputBorder.none, // still no border when not focused
    focusedBorder: OutlineInputBorder( // show border when focused
      borderSide: BorderSide(color: Colors.white, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
),

const SizedBox(height: 10),

TextField(
  style: const TextStyle(color: Colors.white),
  onChanged: (value) {
    print("🗒️ Description: $value"); // ✅ Debug print
    context.read<AddTaskBloc>().add(DescriptionChanged(value));
  },
  decoration: const InputDecoration(
    hintText: "Description",
    hintStyle: TextStyle(color: Colors.white54),
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
),

          
                const SizedBox(height: 20),
          const SizedBox(height: 20),
          
          Row(
            
            children: [
              // Calendar
           GestureDetector(
  onTap: () => showCalendarPicker(context),
  child: Column(
    children: [
      Image.asset(
        'lib/assets/images/homeImages/timer.png', // Replace if different
        width: 32,
        height: 32,
        color: Colors.white,
      ),
      const SizedBox(height: 4),

    ],
  ),
),

      const SizedBox(width: 5),        
          
              // Time
          //     Column(
          //       children: [
          // IconButton(
          //   icon: const Icon(Icons.access_time, color: Colors.white),
          //   onPressed: () => showTimePickerDialog(context),
          // ),
          // const Text("Time", style: TextStyle(color: Colors.white70, fontSize: 12)),
          //       ],
          //     ),
          
              // Category
            GestureDetector(
  onTap: () => showCategoryPickerDialog(context),
  child: Column(
    children: [
      Image.asset(
        'lib/assets/images/homeImages/tag.png', // Use your correct path here
        width: 32,
        height: 32,
        color: Colors.white,
      ),
      const SizedBox(height: 4),
   
    ],
  ),
),
const SizedBox(width: 5),        
              // Priority
              GestureDetector(
 onTap: () {
  showPriorityPickerDialog(
    context,
    state.priority,
    (_) {}, // if you don't need to do anything on selection
  );
},

  child: Column(
    children: [
      Image.asset(
        'lib/assets/images/homeImages/flag.png',
        width: 32,
        height: 32,
        color: Colors.white,
      ),
      const SizedBox(height: 4),

      
    ],
  ),
),
SizedBox(width: 230),

              GestureDetector(
  onTap: () {
    final task = TaskModel(
      title: state.title,
      description: state.description,
      date: state.date ?? DateTime.now(),
      time: state.time ?? TimeOfDay.now(),
      priority: state.priority,
      category: state.category,
      categoryColor: state.categoryColor,
    );

    context.read<home_bloc.HomeBloc>().add(home_bloc.AddTaskEvent(task));
    Navigator.pop(context);
  },
  child: Image.asset(
    'lib/assets/images/homeImages/send.png', // replace with your send icon
    width: 40, // adjust size as needed
    height: 40,
  ),
),     
          

            ],
          ),
          
              
       

              ],
            ),
          ),
        );
      },
    );
  }
}


  

