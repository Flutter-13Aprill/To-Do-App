import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/app_model.dart';
import 'bloc/task_bloc.dart';
import 'bloc/task_event.dart';

class ChooseCategoryDialog extends StatelessWidget {
  const ChooseCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryModel(
        name: 'Grocery',
        icon: Icons.local_grocery_store,
        color: Colors.lightGreen,
      ),
      CategoryModel(name: 'Work', icon: Icons.work, color: Colors.orange),
      CategoryModel(
        name: 'Sport',
        icon: Icons.fitness_center,
        color: Colors.cyan,
      ),
      CategoryModel(
        name: 'Design',
        icon: Icons.videogame_asset,
        color: Colors.teal,
      ),
      CategoryModel(
        name: 'University',
        icon: Icons.school,
        color: Colors.indigo,
      ),
      CategoryModel(name: 'Social', icon: Icons.campaign, color: Colors.pink),
      CategoryModel(
        name: 'Music',
        icon: Icons.music_note,
        color: Colors.purple,
      ),
      CategoryModel(name: 'Health', icon: Icons.favorite, color: Colors.green),
      CategoryModel(name: 'Movie', icon: Icons.movie, color: Colors.lightBlue),
      CategoryModel(name: 'Home', icon: Icons.home, color: Colors.amber),
    ];

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2D2D2D),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Choose Category",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                ...categories.map(
                  (cat) => GestureDetector(
                    onTap: () {
                      context.read<TaskBloc>().add(
                        TaskCategoryChanged(
                          name: cat.name,
                          icon: cat.icon,
                          color: cat.color,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: cat.color,
                          child: Icon(cat.icon, color: Colors.white),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          cat.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    final newCategory = await showDialog<CategoryModel>(
                      context: context,
                      builder: (_) => const CreateCategoryDialog(),
                    );
                    if (newCategory != null && context.mounted) {
                      context.read<TaskBloc>().add(
                        TaskCategoryChanged(
                          name: newCategory.name,
                          icon: newCategory.icon,
                          color: newCategory.color,
                        ),
                      );
                    }
                  },
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.greenAccent,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      SizedBox(height: 6),
                      Text("Create New", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
