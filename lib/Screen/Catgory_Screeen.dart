import 'package:flutter/material.dart';
import 'package:to_do_app_development/Models/Catagory_Model.dart';
<<<<<<< HEAD
import 'package:easy_localization/easy_localization.dart';
=======
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed

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
<<<<<<< HEAD
      const Color(0xFFC9CC41),
      const Color(0xFF66CC41),
      const Color(0xFF4181CC),
      const Color(0xFF41A2CC),
      const Color(0xFFCC8441),
      const Color(0xFF9741CC),
      const Color(0xFFCC4173),
    ];
=======
      Color(0xFFC9CC41),
      Color(0xFF66CC41),
      Color(0xFF4181CC),
      Color(0xFF41A2CC),
      Color(0xFFCC8441),
      Color(0xFF9741CC),
      Color(0xFFCC4173),
    ];

>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF121212),
<<<<<<< HEAD
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            'create_new_category'.tr(),
            style: const TextStyle(color: Colors.white, fontSize: 24),
=======
        title: const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(
            'Create New Category',
            style: TextStyle(color: Colors.white, fontSize: 24),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
          ),
        ),
        toolbarHeight: 80,
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          final matchingIcon =
              selectedIconName != null ? iconMap[selectedIconName!] : null;
<<<<<<< HEAD
    
=======

>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< HEAD
                  Text(
                    'category_name'.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
=======
                  const Text(
                    'Category name:',
                    style: TextStyle(color: Colors.white, fontSize: 14),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    onChanged: (value) => categoryName = value.trim(),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
<<<<<<< HEAD
                      hintText: 'hint_category_name'.tr(),
=======
                      hintText: ' Category name',
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                  Text(
                    'category_icon'.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
=======
                  const Text(
                    'Category icon:',
                    style: TextStyle(color: Colors.white, fontSize: 14),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                          labelText: "choose_icon".tr(),
=======
                          labelText: "Choose icon from library",
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: const Color(0xFF4D4D4D),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
<<<<<<< HEAD
                        items: iconMap.entries
                            .map((entry) => DropdownMenuItem<String>(
                                  value: entry.key,
                                  child:
                                      Icon(entry.value, color: Colors.white),
                                ))
                            .toList(),
=======
                        items: iconMap.entries.map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.key,
                            child: Icon(entry.value, color: Colors.white),
                          );
                        }).toList(),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                      child:
                          Icon(matchingIcon, color: Colors.white, size: 36),
                    ),
                  const SizedBox(height: 25),
                  Text(
                    'choose_color'.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
=======
                      child: Icon(matchingIcon, color: Colors.white, size: 36),
                    ),
                  const SizedBox(height: 25),
                  const Text(
                    'Choose Catagory color:',
                    style: TextStyle(color: Colors.white, fontSize: 14),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                            CircleAvatar(
                              backgroundColor: color,
                              radius: 20,
                            ),
                            if (isSelected)
                              const Icon(Icons.check,
                                  color: Colors.white, size: 18),
=======
                            CircleAvatar(backgroundColor: color, radius: 20),
                            if (isSelected)
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                          child: Text(
                            'cancel'.tr(),
                            style:
                                const TextStyle(color: Color(0xFF8687E7)),
=======
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Color(0xFF8687E7)),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
<<<<<<< HEAD
                          child: Text(
                            'create_category'.tr(),
                            style: const TextStyle(color: Colors.white),
=======
                          child: const Text(
                            'Create Category',
                            style: TextStyle(color: Colors.white),
>>>>>>> cdd6b355a4275f9c1fc6085dd11dcb1a41ec23ed
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
