import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/features/Index/model/category.dart';
import 'package:todo_app/features/index/bloc/index_bloc.dart';
import 'package:todo_app/features/index/widget/buttons_widget.dart';
import 'package:todo_app/style/style_color.dart';
import 'package:todo_app/style/style_text.dart';

/// Shows a dialog allowing the user to select a category.
/// ///
/// [context] - The BuildContext to display the dialog.
/// [bloc] - The IndexBloc instance where the selected category is saved.
showCategoryDialog(context, IndexBloc bloc) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String? chooseCategory;
      return Dialog(
        backgroundColor: StyleColor.grey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 500,
            child: Column(
              children: [
                Text('chooseCategory'.tr(), style: StyleText.latoBold16),
                Divider(color: Colors.white),
                Expanded(
                  child: GridView.builder(
                    itemCount: categoryList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: categoryList[index].color,
                            ),
                            onPressed: () {
                              chooseCategory = categoryList[index].category;
                            },
                            child: SvgPicture.asset(
                              categoryList[index].imageSVG,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Text(categoryList[index].category.tr()),
                        ],
                      );
                    },
                  ),
                ),
                ButtonsWidget(
                  text: "save".tr(),
                  onPressedNext: () {
                    if (chooseCategory != null) {
                      bloc.category = chooseCategory!;
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
