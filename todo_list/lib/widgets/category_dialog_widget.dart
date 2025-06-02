import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/category/category_screen.dart';
import 'package:todo_list/screens/index/bloc/index_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';

class CategoryDialogWidget extends StatelessWidget {
  CategoryDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.darkGray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Center(
        child: Text(
          'task_category'.tr(),
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: BlocBuilder<IndexBloc, IndexState>(
          builder: (context, state) {
            final bloc = context.read<IndexBloc>();

            int? selectedIndex;
            if (state is CategoryUpdatedState) {
              selectedIndex = bloc.selectedCategory;
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(color: Colors.grey[700]),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: bloc.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final category = bloc.categories[index];
                      final icon =
                          bloc.categoryIcons[category] ?? Icons.category;
                      final color =
                          bloc.iconColors[index % bloc.iconColors.length];
                      final backgroundColor = color.withOpacity(0.4);
                      final isSelected = selectedIndex == index;

                      return GestureDetector(
                        onTap: () {
                          if (index == 10) {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CategoryScreen(),
                              ),
                            );
                          } else {
                            bloc.add(CategorySelectedEvent(index));
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? color.withOpacity(0.1)
                                    : backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(icon, color: color, size: 28),
                              SizedBox(height: 6),
                              Text(
                                category,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.getWidth(factor: 0.34),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "cancel".tr(),
                  style: TextStyle(color: AppColors.lightPurole, fontSize: 16),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightPurole,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(context.getWidth(factor: 0.34), 48),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "save".tr(),
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
