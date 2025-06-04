import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/index/categories/categories_screen.dart';
import 'package:getit/CustomWidgets/todo/todo_category_tile.dart';
import 'package:getit/Models/todo_model.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class TodoCategoriesGrid extends StatelessWidget {
  TodoCategoriesGrid({super.key, required this.todo});
  final ToDoModel todo;

  double gridSpacing = 8;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        final bloc = context.read<IndexBloc>();
        final categories = bloc.categories.categories;
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
                        return TodoCategoryTile(
                          name: cat.name,
                          icon: cat.icon,
                          backgroundColor: cat.backgroundColor,
                          onTap: () {
                            bloc.selectedCategory = cat;
                          },
                          iconColor: cat.iconColor,
                        );
                      } else {
                        // “Create New” tile
                        return TodoCategoryTile(
                          name: context.tr("CategoryScreen.createNewTitle"),
                          icon: Icons.add,
                          backgroundColor: greenish,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        bloc.selectedCategory = bloc.categories.categories
                            .firstWhere((c) => c.name == todo.category);
                        Navigator.pop(context);
                        bloc.add(RefreshScreen(context));
                      },
                      child: Text(
                        context.tr("TaskScreen.cancelButton"),
                        style: TextStyle(color: primaryColor),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        bloc.add(RefreshScreen(context));
                        Navigator.pop(context);
                      },
                      child: Text(
                        context.tr("TaskScreen.editTaskButton"),
                        style: TextStyle(color: mainText),
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
  }
}
