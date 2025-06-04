import 'package:flutter/material.dart';
import 'package:to_do_app_development/Models/Catagory_Model.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String categoryName = '';
    IconData? selectedIcon;
    Color selectedColor = const Color(0xFF8687E7);
    String? selectedIconName;

    final iconMap = {
      "Shopping": Icons.shopping_cart,
      "Work": Icons.work,
      "Fitness": Icons.fitness_center,
      "Design": Icons.brush,
      "University": Icons.school,
      "Social": Icons.people,
      "Music": Icons.music_note,
      "Movie": Icons.movie,
      "Home": Icons.home,
    };

    final colors = [
      const Color(0xFFC9CC41),
      const Color(0xFF66CC41),
      const Color(0xFF4181CC),
      const Color(0xFF41A2CC),
      const Color(0xFFCC8441),
      const Color(0xFF9741CC),
      const Color(0xFFCC4173),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF121212),
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            'create_new_category'.tr(),
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        toolbarHeight: 80,
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          final matchingIcon =
              selectedIconName != null ? iconMap[selectedIconName!] : null;
    
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'category_name'.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    onChanged: (value) => categoryName = value.trim(),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'hint_category_name'.tr(),
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF1D1D1D),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF979797),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'category_icon'.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  if (selectedIcon == null)
                    SizedBox(
                      width: 250,
                      child: DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFF4D4D4D),
                        value: null,
                        style: const TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: "choose_icon".tr(),
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: const Color(0xFF4D4D4D),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: iconMap.entries
                            .map((entry) => DropdownMenuItem<String>(
                                  value: entry.key,
                                  child:
                                      Icon(entry.value, color: Colors.white),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedIconName = value;
                            selectedIcon = iconMap[value];
                          });
                        },
                      ),
                    )
                  else
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:
                          Icon(matchingIcon, color: Colors.white, size: 36),
                    ),
                  const SizedBox(height: 25),
                  Text(
                    'choose_color'.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: colors.map((color) {
                      final isSelected = selectedColor == color;
                      return GestureDetector(
                        onTap: () => setState(() => selectedColor = color),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: color,
                              radius: 20,
                            ),
                            if (isSelected)
                              const Icon(Icons.check,
                                  color: Colors.white, size: 18),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 360),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 154,
                        height: 48,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'cancel'.tr(),
                            style:
                                const TextStyle(color: Color(0xFF8687E7)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      SizedBox(
                        width: 153,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8687E7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          onPressed: () {
                            if (categoryName.isNotEmpty &&
                                selectedIcon != null) {
                              final newCategory = Category(
                                name: categoryName,
                                icon: selectedIcon!,
                                color: selectedColor,
                              );
                              Navigator.pop(context, newCategory);
                            }
                          },
                          child: Text(
                            'create_category'.tr(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
