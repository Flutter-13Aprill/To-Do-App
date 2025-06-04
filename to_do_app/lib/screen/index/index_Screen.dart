import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/model/task/task_model.dart';
import 'package:to_do_app/screen/index/bloc/index_bloc.dart';
import 'package:to_do_app/style/app_colors.dart';
import 'package:to_do_app/style/app_text_styles.dart';
import 'package:to_do_app/widget/index/index_bottom_sheet_widget.dart';
import 'package:to_do_app/widget/index/task_card.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<IndexBloc>();
          bloc.add(LoadData());

          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(
                              Icons.format_align_left_outlined,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                        Text("Index", style: AppTextStyles.headerText).tr(),
                        Image.asset("images/profileImg.png", height: 60),
                      ],
                    ),
                    BlocBuilder<IndexBloc, IndexState>(
                      builder: (context, state) {
                        if (state is SuccessLoad &&
                            bloc.dataLayer.tasks.isNotEmpty) {
                          return Column(
                            children: List.generate(
                              bloc.dataLayer.tasks.length,
                              (index) {
                                TaskModel taskinfo =
                                    bloc.dataLayer.tasks[index];
                                return BlocProvider.value(
                                  value: bloc,
                                  child: TaskCard(
                                    id: taskinfo.id,
                                    desciption: taskinfo.desciption,
                                    task: taskinfo.task,
                                    day: taskinfo.day,
                                    month: taskinfo.month,
                                    year: taskinfo.year,
                                    priority: taskinfo.priority,
                                    isDone: taskinfo.isDone,
                                  ),
                                );
                              },
                            ),
                          );
                        }

                        return Column(
                          children: [
                            SizedBox(height: 120),
                            Image.asset("images/index.png"),
                            Text(
                              "What do you want to do today?",
                              style: AppTextStyles.headerText,
                            ).tr(),
                            SizedBox(height: 10),
                            Text(
                              "Tap + to add your tasks",
                              style: AppTextStyles.subText,
                            ).tr(),
                          ],
                        );
                      },
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: AppColors.darkGrey,
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: bloc,
                            child: IndexBottomSheetWidget(),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.primary,
                      ),
                      child: Icon(Icons.add, color: AppColors.white, size: 28),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
