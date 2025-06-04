import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/models/categories/categories_model.dart';
import 'package:to_do_app/core/repo/supabase.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:to_do_app/features/category/categories_screen.dart';
import 'package:to_do_app/features/index/bloc/task_bloc.dart';
import 'package:to_do_app/features/index/widgets/categories_widgets/bloc/categories_bloc.dart';
import 'package:to_do_app/features/index/widgets/categories_widgets/categories_daialog.dart';
import 'package:to_do_app/features/index/widgets/date_widget/bloc/calendar_bloc.dart';
import 'package:to_do_app/features/index/widgets/date_widget/date_daialog.dart';
import 'package:to_do_app/features/index/widgets/priority/bloc/priority_bloc.dart';
import 'package:to_do_app/features/index/widgets/priority/priority_dialog.dart';
import 'package:to_do_app/features/utilts/services/CategoryService.dart';

class AddTaskDialog extends StatelessWidget {
    
  AddTaskDialog({super.key});
Category? selectedCategory;
int? priorityselected;

  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    

    DateTime? fullDateTime;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppPalette.darkGrey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.getShortest(per: 0.6),
          vertical: context.getShortest(per: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                color: AppPalette.textColor,
                fontSize: context.getShortest(per: 0.5),
              ),
            ),
            SizedBox(height: context.getShortest(per: 0.3)),
            _buildTextField(taskController, 'Do math homework'),
            SizedBox(height: context.getShortest(per: 0.2)),
            _buildTextField(descriptionController, 'Description'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.timer_outlined,
                        color: AppPalette.textColor,
                      ),
                      onPressed: () async {
                       final pickedDateTime = await CalendarDialog.show(context);
                        if (pickedDateTime != null) {
                          if(!context.mounted)return;
                          context.read<CalendarBloc>().add(
                                CalendarDateChanged(pickedDateTime),
                              );
                        }
                      },
                    ),
                    
                    const SizedBox(width: 16),
                   
                  IconButton(
  icon: Image.asset('assets/images/tag.png'),
 onPressed: () async {
  final categoryService = GetIt.I<CategoryService>();
  final categoryList = await categoryService.getCategories();

  if (!context.mounted) return;

  final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);

  final selectedCategory = await showDialog(
    context: context,
    builder: (dialogContext) => BlocProvider.value(
      value: categoriesBloc,
      child: CategoryDialog(
        categories: categoryList,
        onCategorySelected: (category) {
          Navigator.pop(dialogContext, category);
        },
        onCreateNew: () async {
          Navigator.pop(dialogContext);

          final newCategory = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CategoriesScreen(),
            ),
          );

          if (newCategory != null) {
            categoryService.clearCache(); 
          }
        },
      ),
    ),
  );

  if (selectedCategory != null) {
     this.selectedCategory = selectedCategory;
  }
},

),

                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        Icons.flag_outlined,
                        color: AppPalette.textColor,
                      ),
                      onPressed: () async {


final priortybloc = BlocProvider.of<PriorityBloc>(context);

final selectedPriority = await showDialog<int>(
  context: context,
  builder: (dialogContext) => BlocProvider.value(
    value: priortybloc,
    child:  PriorityDialog(
    initialPriority: 3,
    
  ),)
);

    if (selectedPriority != null) {
  priorityselected = selectedPriority;
}
  }
                    ),
                  ],
                ),
               IconButton(
  icon: Icon(Icons.send_rounded, color: AppPalette.purble),
  onPressed: () async {
    final task = taskController.text.trim();
    final description = descriptionController.text.trim();
    final dateTime = context.read<CalendarBloc>().state.fullDateTime;

    if (task.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Task title is required")),
      );
      return;
    }

    try {

   
      final taskService =  await SupabaseConnect.addTask(
  title: task,
  description: description.isEmpty ? null : description,
  priority: priorityselected,
  categoryId: selectedCategory!.id,
  dueDate: dateTime,
);
if(!context.mounted)return;

context.read<TaskBloc>().add(LoadTasksEvent());
     

      Navigator.pop(context); 
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add task Check your inputs")),
      );
    }
  },
),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: TextStyle(color: AppPalette.textColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppPalette.textColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPalette.textColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
