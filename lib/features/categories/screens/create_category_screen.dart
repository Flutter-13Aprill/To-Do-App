import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/categories/bloc/category_bloc.dart';
import 'package:to_do_app/features/categories/models/category_model.dart';
// import 'package:to_do_app/features/categories/models/category_model.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  final TextEditingController nameController = TextEditingController();

  IconData? selectedIcon;
  Color? selectedColor;

  final List<IconData> icons = [
    Icons.home,
    Icons.work,
    Icons.school,
    Icons.favorite,
    Icons.movie,
    Icons.music_note,
    Icons.group,
    Icons.sports_soccer,
    Icons.design_services,
  ];

  final List<Color> colors = [
    Colors.yellow,
    Colors.green,
    Colors.lightGreen,
    Colors.cyan,
    Colors.blue,
    Colors.indigo,
    Colors.orange,
    Colors.brown,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Create new category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Category name:', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter category name',
                hintStyle: const TextStyle(color: Colors.white30),
                filled: true,
                fillColor: const Color(0xFF1D1D1D),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Category icon:', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: icons.map((icon) {
                final selected = icon == selectedIcon;
                return GestureDetector(
                  onTap: () => setState(() => selectedIcon = icon),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D1D1D),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: selected ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Icon(icon, color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Category color:',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: colors.map((color) {
                final selected = color == selectedColor;
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = color),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    if (name.isEmpty ||
                        selectedIcon == null ||
                        selectedColor == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please complete all fields"),
                        ),
                      );
                      return;
                    }

                    final category = CategoryModel(
                      name: name,
                      icon: selectedIcon!,
                      color: selectedColor!, id: '',
                    );

                    context.read<CategoryBloc>().add(
                      AddCategoryEvent(category),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8687E7),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Create Category'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
