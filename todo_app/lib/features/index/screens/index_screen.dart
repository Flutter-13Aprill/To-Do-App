import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/index/bloc/index_bloc.dart';
import 'package:todo_app/features/index/widget/task_bottom_sheet.dart';

import 'package:todo_app/style/style_color.dart';
import 'package:todo_app/style/style_text.dart';

/// The main screen of the app showing a list of tasks.
///
/// This screen listens to the [IndexBloc] for task loading .
class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<IndexBloc>()..add(LoadinDataEvent());
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.filter_list_sharp, color: Colors.white),
              title: Text("index".tr(), style: StyleText.latoBold20),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(backgroundColor: Colors.amber),
                ),
              ],
            ),
            body: BlocBuilder<IndexBloc, IndexState>(
              builder: (context, state) {
                if (state is SuccessState && state.tasks.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: StyleColor.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ListTile(
                                    leading: Checkbox(
                                      value: state.tasks[index].isCompleted,
                                      onChanged: (value) {},
                                    ),
                                    title: Text(state.tasks[index].title),
                                    subtitle: Text(
                                      state.tasks[index].taskTime.toString(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      spacing: 8,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Chip - University
                                        Chip(
                                          avatar: const Icon(
                                            Icons.school,
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                          label: Text(
                                            state.tasks[index].category
                                                .toString(),
                                            style: StyleText.latoRegular10,
                                          ),
                                          backgroundColor: StyleColor.purple,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),

                                        Chip(
                                          avatar: const Icon(
                                            Icons.flag_outlined,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                          label: Text(
                                            state.tasks[index].priority
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Checklist.png'),
                          SizedBox(height: 16),
                          Text(
                            'whatToDoToday'.tr(),
                            style: StyleText.latoBold20,
                          ),
                          Text(
                            'tapToAddTasks'.tr(),
                            style: StyleText.latoBold16,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),

            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: StyleColor.grey,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  isScrollControlled: true,
                  builder: (context) {
                    return BlocProvider.value(
                      value: bloc,
                      child: TaskBottomSheet(),
                    );
                  },
                );
              },
              backgroundColor: StyleColor.purple,
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
