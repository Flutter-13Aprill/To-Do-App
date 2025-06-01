import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import 'package:to_do_app/view/layout/bloc/layout_bloc.dart';
import 'package:to_do_app/widget/home/bottomSheet/bottom_sheet_widget.dart';
import 'package:to_do_app/widget/home/category/category_or_priority_widget.dart';
import 'package:to_do_app/widget/mange%20view/mange_view.dart';
import 'package:to_do_app/widget/navbar/navbar_widget.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutBloc(),
      child: Builder(
        builder: (context) {
          var layoutBloc = context.read<LayoutBloc>();

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
                          final List<DateTime>? dateTime =
                              await showOmniDateTimeRangePicker(
                                context: context,
                              );
                              
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
                      return CategoryOrPriorityWidget(categories: layoutBloc.tags, title: 'category',);
                    },
                  );
                }
                if (state is ShowFlagSuccessfully) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CategoryOrPriorityWidget(priority: layoutBloc.priorities, title: 'priority',);
                    },
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.all(16),
                child: Builder(
                  builder: (context) {
                    var layoutBloc = context.read<LayoutBloc>();
                      
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        // here view show 

                        MangeView(
                          layoutIndex: layoutBloc.layoutIndex,
                          taskIsEmpty: layoutBloc.getIt.tasks.isEmpty,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
