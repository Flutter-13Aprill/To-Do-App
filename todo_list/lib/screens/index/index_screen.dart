import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/screens/index/bloc/index_bloc.dart';
import 'package:todo_list/style/app_colors.dart';
import 'package:todo_list/utils/extensions/screen/screen_size.dart';
import 'package:todo_list/widgets/add_task_bottomsheet_widget.dart';
import 'package:todo_list/widgets/edit_task_bottomsheet_widget.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<IndexBloc>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(color: Colors.white),
              title: Text(
                "index".tr(),
                style: TextStyle(color: AppColors.whiteTransparent),
              ),
              leading: Icon(Icons.filter_list_rounded),
              actions: [
                CircleAvatar(
                  maxRadius: 50,
                  child: ClipOval(
                    child: Image.asset("assets/images/profile.png"),
                  ),
                ),
              ],
              centerTitle: true,
            ),
            floatingActionButton: SizedBox(
              height: 80,
              width: 80,
              child: FloatingActionButton(
                shape: CircleBorder(),
                backgroundColor: AppColors.lightPurole,
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return BlocProvider.value(
                        value: bloc,
                        child: AddTaskBottomsheetWidget(),
                      );
                    },
                  );
                },

                child: Icon(Icons.add, color: Colors.white, size: 40),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlocBuilder<IndexBloc, IndexState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is TasksLoadedState) {
                      final tasks = state.tasks;
                      if (tasks.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/index.png",
                                height: context.getHeight(factor: 0.3),
                                width: context.getWidth(factor: 0.8),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "what_to_do".tr(),
                                style: TextStyle(
                                  color: AppColors.whiteTransparent,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "tap_to_add".tr(),
                                style: TextStyle(
                                  color: AppColors.whiteTransparent,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            SearchBar(
                              padding: WidgetStatePropertyAll(
                                const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                              ),
                              elevation: WidgetStatePropertyAll(0),
                              hintText: 'search_for_your_task'.tr(),
                              hintStyle: WidgetStatePropertyAll(
                                TextStyle(color: AppColors.mediumGray),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              side: WidgetStatePropertyAll(
                                BorderSide(color: AppColors.mediumGray),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                AppColors.backgroundColor,
                              ),
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Icon(
                                  Icons.search,
                                  color: AppColors.mediumGray,
                                  size: 30,
                                ),
                              ),
                              onChanged: (value) {
                                bloc.add(SearchTasksEvent(value));
                              },
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: ListView.builder(
                                itemCount: tasks.length,
                                itemBuilder: (context, index) {
                                  final task = tasks[index];

                                  return InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16),
                                          ),
                                        ),
                                        builder: (BuildContext context) {
                                          return BlocProvider.value(
                                            value: bloc,
                                            child: EditTaskBottomsheetWidget(
                                              task: task,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: context.getHeight(factor: 0.09),
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.darkGray,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              task.isCompleted
                                                  ? Icons.check_circle_outline
                                                  : Icons.circle_outlined,
                                              color: AppColors.whiteTransparent,
                                            ),
                                            onPressed: () {
                                              if (task.id != null) {
                                                bloc.add(
                                                  ToggleTaskCompletedEvent(
                                                    task.id!,
                                                  ),
                                                );
                                              } else {
                                                print('Task ID is null!');
                                              }
                                            },
                                          ),

                                          const SizedBox(width: 16),

                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  task.title,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),

                                                const SizedBox(height: 4),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        (task.datetime != null)
                                                            ? bloc
                                                                .formatDateTimeHumanFriendly(
                                                                  context,
                                                                  task.datetime,
                                                                )
                                                            : "date",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),

                                                    const SizedBox(width: 8),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: bloc
                                                            .iconColors[task
                                                                .categoryId!]
                                                            .withOpacity(0.4),

                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              5,
                                                            ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 4.0,
                                                              horizontal: 8,
                                                            ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              bloc.categoryIcons[bloc
                                                                  .categories[task
                                                                  .categoryId!]],
                                                              size: 18,
                                                              color:
                                                                  bloc.iconColors[task
                                                                      .categoryId!],
                                                            ),
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text(
                                                              "${task.categoryId}",
                                                              style: TextStyle(
                                                                color:
                                                                    AppColors
                                                                        .whiteTransparent,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              AppColors
                                                                  .lightPurole,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              5,
                                                            ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              2.0,
                                                            ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .flag_outlined,
                                                              size: 18,
                                                              color:
                                                                  AppColors
                                                                      .whiteTransparent,
                                                            ),
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text(
                                                              "${task.priority}",
                                                              style: TextStyle(
                                                                color:
                                                                    AppColors
                                                                        .whiteTransparent,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                    } else if (state is ErrorState) {
                      return Center(child: Text('error_occurred'.tr()));
                    }
                    return Container();
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
