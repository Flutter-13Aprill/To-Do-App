import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/Theme/app_colors.dart';
import 'package:to_do_app/layer_data/app_data.dart';
import 'package:to_do_app/models/category_model.dart';
import 'package:to_do_app/utils/extensions/screen_size.dart';
import 'package:to_do_app/widgets/home_widget/card_icon_widget.dart';
import 'package:to_do_app/widgets/home_widget/handel_buttons.dart';

class CategoryOrPriorityWidget extends StatelessWidget {
  const CategoryOrPriorityWidget({
    super.key,
    required this.title,
    this.isEdit = false,
  });
  final bool isEdit;
  final String title;
  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = GetIt.I<AppDataLayer>().categoryList;
    final List<int>? priorities=GetIt.I<AppDataLayer>().priorities;

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
                    itemCount: categories .isNotEmpty
                        ? categories.length + 1
                        : priorities!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 9,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final isLastIndex = categories .isNotEmpty
                          ? index == categories.length
                          : index == priorities!.length;

                      return CardIconWidget(
                        index: index,
                        isLasIndex: isLastIndex,
                        category: isLastIndex && categories.isNotEmpty
                            ? categories[index]
                            : null,
                        priority: !isLastIndex && categories.isNotEmpty
                            ? priorities![index]
                            : null,
                      );
                    },
                  ),
                ),
                if (priorities != null)
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
                if (categories.isNotEmpty)
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
