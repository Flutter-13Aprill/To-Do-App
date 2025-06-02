import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_darkmode/theme/style/app_colors.dart';
import 'package:todoapp_darkmode/theme/style/app_fonts.dart';
import 'package:todoapp_darkmode/widgets/addTask/bloc/add_task_bloc.dart';
import 'package:todoapp_darkmode/widgets/addTask/bloc/add_task_state.dart';


void showCategoryPickerDialog(BuildContext context) {
  final categories = [
    {"name": "Grocery", "color": AppColors.pastelLime, "image": "grocery.png"},
    {"name": "Work", "color": AppColors.pastelCoral, "image": "work.png"},
    {"name": "Sport", "color": AppColors.pastelCyan, "image": "sport.png"},
    {"name": "Design", "color": AppColors.pastelMint, "image": "design.png"},
    {
      "name": "University",
      "color": AppColors.pastelIndigo,
      "image": "gradcap.png",
    },
    {"name": "Social", "color": AppColors.pastelMagenta, "image": "social.png"},
    {"name": "Music", "color": AppColors.pastelMagenta, "image": "music.png"},
    {"name": "Health", "color": AppColors.pastelGreen, "image": "health.png"},
    {
      "name": "Movie",
      "color": AppColors.skyBlue,
      "image": "video-camera 1.png",
    },
    {"name": "Home", "color": AppColors.pastelOrange, "image": "home.png"},
    {
      "name": "Create New",
      "color": AppColors.pastelGreen,
      "image": "createNew.png",
    },
  ];

  Map<String, dynamic>? tempSelected;

  showDialog(
    context: context,
    builder: (ctx) {
  return BlocProvider.value(
    value: BlocProvider.of<AddTaskBloc>(context),
    child: Builder(
      builder: (newContext) => AlertDialog(
        backgroundColor: AppColors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: SizedBox(
          width: 327,
          height: 540,
          child: Column(
            children: [
              Text("Choose Category", style: AppFonts.fontSizeThree),
              const SizedBox(height: 16),
              Container(height: 1, color: Colors.white),
              const SizedBox(height: 16),
              BlocBuilder<AddTaskBloc, AddTaskState>(
                builder: (context, state) {
                  return Wrap(
                    spacing: 24,
                    runSpacing: 16,
                    children: categories.map((cat) {
                      return GestureDetector(
                     onTap: () {
  final name = cat["name"] as String;
  final color = cat["color"] as Color;
  final image = cat["image"] as String;

  print("🟣 Tapped Category: $name");

  context.read<AddTaskBloc>().add(
    CategoryPicked(name, color, image),
  );
},


                        child: Column(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                             decoration: BoxDecoration(
  color: cat["color"] as Color,
  borderRadius: BorderRadius.circular(4),
  border: Border.all(
    color: (state.category == cat["name"]) ? Colors.white : Colors.transparent,
    width: 2,
  ),
),

                              child: Center(
                                child: Image.asset(
                                  "lib/assets/images/categoryImages/${cat['image']}",
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              cat["name"] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (tempSelected != null) {
                          context.read<AddTaskBloc>().add(
                            CategoryPicked(
                              tempSelected!["name"] as String,
                              tempSelected!["color"] as Color,
                              tempSelected!["image"] as String,
                            ),
                          );
                        }
                        Navigator.pop(ctx);
                        print("Category picked: ${tempSelected!["name"]}");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lilac,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    )
  );
    },
  );
}
