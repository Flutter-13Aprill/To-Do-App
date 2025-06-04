import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/views/layout/bloc/layout_bloc.dart';
import 'package:to_do_app/widgets/home_widget/bottom_sheet_widget.dart';
import 'package:to_do_app/widgets/home_widget/category_or_priority_widget.dart';
import 'package:to_do_app/widgets/layout/mange%20view/mange_view.dart';

import 'package:to_do_app/widgets/navbar/navbar_widget.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutBloc(),
      child: Builder(
        builder: (context) {
          var layoutBloc = context.read<LayoutBloc>();

          return BlocBuilder<LayoutBloc, LayoutState>(
            buildWhen: (previous, current) {
              if (current is ChangePageSuccessfully) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              int layoutIndex = layoutBloc.layoutIndex;
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    print("add");
                    layoutBloc.add(ShowBottomSheet());
                  },
                  child: Icon(Icons.add),
                ),
                bottomNavigationBar: NavbarWidget(),
                appBar: AppBar(
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      print("sort");
                    },
                    icon: Icon(Icons.sort),
                  ),
                  title: Text("Index"),
                  actions: [
                    CircleAvatar(
                      maxRadius: 40,
                      child: Image.asset("lib/assets/images/home/person.png"),
                    ),
                  ],
                ),
                body: BlocListener<LayoutBloc, LayoutState>(
                  listener: (context, state) {
                    if (state is ShowBottomSheetSuccessfully) {
                      showBottomSheet(
                        context: context,
                        builder: (context) {
                          return BottomSheetWidget(
                            calenderEvent: () async {
                              final  DateTime dateTime = DateTime(2025, 6, 1, 17, 0, 0);
                              return dateTime;
                            },
                            tagEvent: () {
                              layoutBloc.add(ShowTag());
                            },
                            flagEvent: () {
                              layoutBloc.add(ShowFlag());
                            },
                          );
                        },
                      );
                    }
                    if (state is ShowTagSuccessfully) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CategoryOrPriorityWidget( title: 'category');
                        },
                      );
                    }
                    if (state is ShowFlagSuccessfully) {
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return CategoryOrPriorityWidget(priority: layoutBloc.priorities, title: 'priority',);
                      //   },
                      // );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MangeView(
                          layoutIndex: layoutIndex,
                          taskIsEmpty: layoutBloc.getIt.tasks.isEmpty,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
