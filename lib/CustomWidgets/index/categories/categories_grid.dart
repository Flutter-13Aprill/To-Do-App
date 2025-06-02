import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/index/categories/categories_screen.dart';
import 'package:getit/CustomWidgets/index/categories/category_tile.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key});

  double gridSpacing = 8;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        final bloc = context.read<IndexBloc>();
        final categories = bloc.categories.categories;
        final colors = bloc.categories.colorOptions;
        return AlertDialog(
          backgroundColor: containerColor,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.tr("CategoryScreen.chooseCategory"),
                textAlign: TextAlign.center,
              ),
              Divider(),
            ],
          ),
          content: SizedBox(
            height: context.screenHeight * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: context.screenHeight * 0.45,
                  width: context.screenWidth,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length + 1, // +1 for “Create New”
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: gridSpacing,
                      crossAxisSpacing: gridSpacing,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      if (index < categories.length) {
                        final cat = categories[index];
                        return CategoryTile(
                          name: cat.name,
                          icon: cat.icon,
                          backgroundColor: cat.backgroundColor,
                          onTap: () {
                            bloc.selectedCategory = cat;
                            Navigator.pop(context);
                          },
                          iconColor: colors[Random().nextInt(colors.length)],
                        );
                      } else {
                        // “Create New” tile
                        return CategoryTile(
                          name: context.tr("CategoryScreen.createNewTitle"),
                          icon: Icons.add,
                          backgroundColor:
                              bloc.categories.colorOptions[bloc
                                      .categories
                                      .colorOptions
                                      .length -
                                  1],
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return BlocProvider.value(
                                    value: bloc,
                                    child: CategoriesScreen(),
                                  );
                                },
                              ),
                            );
                          },
                          iconColor: mainText,
                        );
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    context.tr("CategoryScreen.addCategoryButton"),
                    style: TextStyle(color: mainText),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
