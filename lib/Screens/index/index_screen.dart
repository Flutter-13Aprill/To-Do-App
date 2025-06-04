import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getit/CustomWidgets/index/add_task_sheet.dart';
import 'package:getit/CustomWidgets/index/custom_search_bar.dart';
import 'package:getit/CustomWidgets/index/empty_index.dart';
import 'package:getit/CustomWidgets/shared/todo_tile.dart';
import 'package:getit/Screens/index/bloc/index_bloc.dart';
import 'package:getit/Screens/todo/todo_screen.dart';
import 'package:getit/Styles/colors.dart';
import 'package:getit/Utilities/screen_extension.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexBloc(),
      child: BlocBuilder<IndexBloc, IndexState>(
        builder: (context, state) {
          var bloc = context.read<IndexBloc>();
          return BlocListener<IndexBloc, IndexState>(
            listener: (listenerContext, state) {
              if (state is ToDosLoading) {
                showDialog(
                  context: listenerContext,
                  barrierDismissible: false,
                  builder: (listenerCintext) {
                    return Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    );
                  },
                );
              }

              if (state is AddTaskDialogShown) {
                var bloc = listenerContext.read<IndexBloc>();

                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: containerColor,
                  showDragHandle: true,

                  context: listenerContext,
                  builder: (listenerContext) {
                    return BlocProvider.value(
                      value: bloc,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: context.keyboardPadding,
                        ),
                        child: AddTaskSheet(),
                      ),
                    );
                  },
                );
              }
              if (state is TodoAdded) {
                Navigator.pop(listenerContext);
              }
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,

                title: Text(
                  context.tr("IndexScreen.tab"),
                  style: TextStyle(color: mainText),
                ),
                leading: Icon(Icons.filter_list, color: mainText),
                actions: [Image.asset("assets/images/pfp.png")],
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: primaryColor,
                shape: CircleBorder(),
                onPressed: () {
                  bloc.add(AddToDoButtonPressed());
                },
                child: Icon(Icons.add, color: mainText),
              ),
              body: bloc.supabase.todosList.isEmpty
                  ? Center(child: EmptyIndex())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: context.screenHeight * 0.02),
                        CustomSearchBar(),
                        SizedBox(height: context.screenHeight * 0.02),
                        SizedBox(
                          height: context.screenHeight * 0.5,
                          width: context.screenWidth,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  bloc.selectedCategory = bloc
                                      .categories
                                      .categories
                                      .firstWhere(
                                        (c) =>
                                            c.name ==
                                            bloc
                                                .supabase
                                                .todosList[index]
                                                .category,
                                      );
                                  bloc.selectedPriority = bloc
                                      .supabase
                                      .todosList[index]
                                      .priority
                                      .toString();
                                  bloc.fullDateTime = DateTime.parse(
                                    bloc.supabase.todosList[index].dueDate,
                                  ).toLocal();

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider.value(
                                        value: bloc,
                                        child: TodoScreen(
                                          todoId: bloc
                                              .supabase
                                              .todosList[index]
                                              .id!,
                                          category: bloc.selectedCategory!,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: BlocProvider.value(
                                  value: bloc,
                                  child: TodoTile(
                                    todo: bloc.supabase.todosList[index],
                                  ),
                                ),
                              );
                            },
                            itemCount: bloc.supabase.todosList.length,
                          ),
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
