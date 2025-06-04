import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:to_do_app_development/Models/Catagory_Model.dart';
import 'package:to_do_app_development/Models/Task_model.dart';
import 'package:to_do_app_development/Screen/Catgory_Screeen.dart';

import 'package:easy_localization/easy_localization.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});
  @override
  State<AddTaskDialog> createState() => _AddTaskDialogWidgetState();
}

class _AddTaskDialogWidgetState extends State<AddTaskDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  Category? seletedCatagory;
  TaskPriority priority = TaskPriority.p1;

  // --- Date Picker Dialog ---
  Future<void> _pickDate() async {
    final DateTime now = DateTime.now();
    DateTime tempDate = selectedDate ?? now;

    final DateTime? pickedDate = await showDialog<DateTime>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF2C2C2C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Theme(
                    data: ThemeData.dark().copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: Color(0xFF8875FF),
                        onPrimary: Colors.white,
                        surface: Color(0xFF2C2C2C),
                        onSurface: Colors.white,
                      ),
                      dialogBackgroundColor: const Color(0xFF2C2C2C),
                      textTheme: const TextTheme(
                        bodyLarge: TextStyle(color: Colors.white),
                        bodyMedium: TextStyle(color: Colors.white),
                      ),
                    ),
                    child: CalendarDatePicker(
                      initialDate: tempDate,
                      firstDate: now,
                      lastDate: DateTime(now.year + 5),
                      onDateChanged: (date) {
                        tempDate = date;
                      },
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'cancel'.tr(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, tempDate),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF8875FF),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        'choose_time'.tr(),
                        style: const TextStyle(color: Colors.white),
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

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
      await _pickTime();
    }
  }

  // --- Time Picker Dialog ---
  Future<void> _pickTime() async {
    TimeOfDay tempTime = selectedTime ?? TimeOfDay.now();

    final TimeOfDay? pickedTime = await showDialog<TimeOfDay>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF2C2C2C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'choose_time'.tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),

                Divider(color: Colors.white24, thickness: 1),
                const SizedBox(height: 8),
                const SizedBox(height: 12),
                TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.white54,
                  ),
                  highlightedTextStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  spacing: 40,
                  itemHeight: 40,
                  isForce2Digits: true,
                  onTimeChange: (dateTime) {
                    tempTime = TimeOfDay.fromDateTime(dateTime);
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'cancel'.tr(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, tempTime),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF8875FF),
                      ),
                      child: Text(
                        'save'.tr(),
                        style: const TextStyle(color: Colors.white),
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

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  // --- Priority Picker ---
  // --- Priority Picker ---
  Future<void> _pickPriority() async {
    TaskPriority selected = priority;

    final result = await showDialog<TaskPriority>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF2C2C2C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'task_priority'.tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Divider(color: Colors.white24, thickness: 1),
                const SizedBox(height: 12),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  childAspectRatio: 1.2,
                  children:
                      TaskPriority.values.map((p) {
                        final isSelected = p == selected;
                        return GestureDetector(
                          onTap: () => Navigator.pop(context, p),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? const Color(0xFF8875FF)
                                      : const Color(0xFF3A3A3A),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.flag_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  (p.index + 1).toString(),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'cancel'.tr(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, selected),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF8875FF),
                      ),
                      child: Text(
                        'save'.tr(),
                        style: const TextStyle(color: Colors.white),
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

    if (result != null) setState(() => priority = result);
  }

  void _submitTask() {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('title_required'.tr())));
      return;
    }

    final task = Task(
      title: _titleController.text.trim(),
      description: _descController.text.trim(),
      dueDate: selectedDate,
      dueTime: selectedTime,
      priority: priority,
      category: seletedCatagory!,
    );

    Navigator.of(context).pop(task);
  }

  List<Category> categories = [
    Category(
      name: "Grocery".tr(),
      icon: Icons.shopping_cart,
      color: Colors.green,
    ),
    Category(name: "Work".tr(), icon: Icons.work, color: Colors.orange),
    Category(
      name: "Sport".tr(),
      icon: Icons.fitness_center,
      color: Colors.blue,
    ),
    Category(name: "Design".tr(), icon: Icons.brush, color: Colors.purple),
    Category(name: "University".tr(), icon: Icons.school, color: Colors.pink),
    Category(name: "Social".tr(), icon: Icons.people, color: Colors.cyan),
    Category(name: "Music".tr(), icon: Icons.music_note, color: Colors.red),
    Category(
      name: "Health".tr(),
      icon: Icons.health_and_safety,
      color: Colors.teal,
    ),
    Category(name: "Movie".tr(), icon: Icons.movie, color: Colors.indigo),
    Category(name: "Home".tr(), icon: Icons.home, color: Colors.brown),
  ];

  Future<void> _pickCategory(BuildContext context) async {
    final selectedCategory = await showDialog<Category>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF363636),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'choose_category'.tr(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider(color: Colors.white24, thickness: 1),
                const SizedBox(height: 8),
                const SizedBox(height: 24),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    if (index < categories.length) {
                      final category = categories[index];
                      return GestureDetector(
                        onTap: () => Navigator.pop(context, category),
                        child: Column(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: category.color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                category.icon,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category.name,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () async {
                          final newCategory = await Navigator.push<Category>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryScreen(),
                            ),
                          );
                          if (newCategory != null) {
                            Navigator.pop(context, newCategory);
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4D4D4D),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFF8687E7),
                                  width: 1.5,
                                ),
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'create_new'.tr(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (selectedCategory != null) {
      setState(() {
        categories.add(selectedCategory); //  Add new category
        seletedCatagory = selectedCategory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'add_task'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _titleController,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'task_title'.tr(),
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: const Color(0xFF2C2C2C),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'enter_description'.tr(),
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: const Color(0xFF2C2C2C),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.category, color: Colors.white70),
                    onPressed: () => _pickCategory(context),
                    tooltip: 'category'.tr(),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.calendar_today,
                      color: Colors.white70,
                    ),
                    onPressed: _pickDate,
                    tooltip: 'pick_date'.tr(),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.flag_outlined,
                      color: Colors.white70,
                    ),
                    onPressed: _pickPriority,
                    tooltip: 'priority'.tr(),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF8875FF)),
                    onPressed: _submitTask,
                    tooltip: 'submit'.tr(),
                  ),
                ],
              ),

              if (selectedDate != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${'selected_date'.tr()}: ${selectedDate!.toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              if (selectedTime != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '${'selected_time'.tr()}: ${selectedTime!.format(context)}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
