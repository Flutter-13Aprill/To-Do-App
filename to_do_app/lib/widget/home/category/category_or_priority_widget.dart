import 'package:flutter/material.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/models/category_model.dart';
import 'package:to_do_app/utils/extensions/screen_size.dart';
import 'package:to_do_app/widget/home/buttons/handel_buttons.dart';
import 'package:to_do_app/widget/home/card_icon_widget.dart';

class CategoryOrPriorityWidget extends StatelessWidget {
  const CategoryOrPriorityWidget({
    super.key,
    this.categories,
    required this.title,
    this.priority,
    this.isEdit = false,
  });
  final List<CategoryModel>? categories;
  final List<int>? priority;
  final bool isEdit;
  final String title;
  @override
  Widget build(BuildContext context) {

    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        color: AppColors.background,
        height: context.getHight(pre: 0.7),
        width: context.getWight(),
        child: Column(
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            Divider(height: 4),
            Column(
              children: [
                Container(
                  // color: AppColors.divider,
                  width: context.getWight(),
                  height: context.getHight(pre: 0.5),
                  child: GridView.builder(
                    itemCount: categories != null
                        ? categories!.length + 1
                        : priority!.length,
                    gridDelegate: 
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 9,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final isLastIndex = categories != null
                          ? index == categories!.length
                          : index == priority!.length;

                      return CardIconWidget(
                        index: index,
                        isLasIndex: isLastIndex,
                        category: !isLastIndex && categories != null
                            ? categories![index]
                            : null,
                        priority: !isLastIndex && categories == null
                            ? priority![index]
                            : null,
                      );
                    },
                  ),
                ),
                if (priority != null)
                  HandelButtons(
                    isTowButton: true,
                    isCategory: false,
                    titleB1: "cancel",
                    onTap1: () {
                      print(" cancel");
                      Navigator.pop(context);
                    },
                    titleB2: "save",
                    onTap2: () {
                      print("save");
                      Navigator.pop(context);
                    },
                  ),
                if (categories != null)
                  HandelButtons(
                    isTowButton: false,
                    isCategory: true,
                    onTap1: () {
                      print("Add Category");
                      Navigator.pop(context);
                    },
                    titleB1: "Add Category",
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
