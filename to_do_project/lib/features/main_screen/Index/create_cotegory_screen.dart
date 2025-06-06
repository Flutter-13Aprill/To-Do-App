import 'package:flutter/material.dart';
import '../../../../models/app_model.dart';

class CreateCategoryDialog extends StatefulWidget {
  const CreateCategoryDialog({super.key});

  @override
  State<CreateCategoryDialog> createState() => _CreateCategoryDialogState();
}

class _CreateCategoryDialogState extends State<CreateCategoryDialog> {
  String name = '';
  IconData? selectedIcon;
  Color? selectedColor;

  final colors = [
    Colors.lime,
    Colors.green,
    Colors.cyan,
    Colors.lightBlue,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];

  final icons = [
    Icons.home,
    Icons.work,
    Icons.school,
    Icons.favorite,
    Icons.movie,
    Icons.music_note,
    Icons.local_grocery_store,
    Icons.sports_soccer,
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF2D2D2D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Create new category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Category name",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Category icon:",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Wrap(
                spacing: 10,
                children: icons.map((icon) {
                  final isSelected = selectedIcon == icon;
                  return GestureDetector(
                    onTap: () => setState(() => selectedIcon = icon),
                    child: CircleAvatar(
                      backgroundColor: isSelected
                          ? Colors.white
                          : Colors.grey[800],
                      child: Icon(
                        icon,
                        color: isSelected ? Colors.black : Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Category color:",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Wrap(
                spacing: 10,
                children: colors.map((color) {
                  final isSelected = selectedColor == color;
                  return GestureDetector(
                    onTap: () => setState(() => selectedColor = color),
                    child: CircleAvatar(
                      backgroundColor: color,
                      child: isSelected
                          ? const Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8875FF),
                    ),
                    onPressed: () {
                      if (name.isNotEmpty &&
                          selectedIcon != null &&
                          selectedColor != null) {
                        final newCategory = CategoryModel(
                          name: name,
                          icon: selectedIcon!,
                          color: selectedColor!,
                        );
                        Navigator.pop(context, newCategory);
                      }
                    },
                    child: const Text("Create Category"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
