import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/extension/git_size_screen.dart';
import 'package:project6/core/extension/navigation.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/core/widget/button/custom_Icon_button.dart';
import 'package:project6/core/widget/custom_show_dialog.dart';
import 'package:project6/core/widget/custom_text_field.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';
import 'package:project6/feature/home/presentation/page/category_page.dart';
import 'package:project6/feature/home/presentation/widget/calendar.dart';
import 'package:project6/feature/home/presentation/widget/category_screens/choose_category.dart';
import 'package:project6/feature/home/presentation/widget/task_priority.dart';
import 'package:project6/feature/home/presentation/widget/time.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CustomTextField(
            controller: bloc.taskController,
            text: AppText.hintTask,
            labelText: AppText.task,
          ),

          CustomTextField(
            controller: bloc.descriptionController,
            text: AppText.hintDescription,
            labelText: AppText.description,
          ),
          Row(
            children: [
              CustomIconButton(
                onPressed: () async {
                  await CustomShowDialog.show(
                    context: context,
                    blocContext: context,
                    text: AppText.time,

                    onPressed: () async {
                      Navigator.of(context).pop();
                      await CustomShowDialog.show(
                        context: context,
                        blocContext: context,
                        text: AppText.save,
                        onPressed: () {
                          print('Selected date: ${bloc.formattedDate}');
                          print('Selected time: ${bloc.formattedTime}');
                          context.customPop();
                        },
                        title: Text(
                          textAlign: TextAlign.center,
                          AppText.time,
                          style: TextStyles.lato70016,
                        ),
                        content: BlocProvider.value(
                          value: bloc,
                          child: SizedBox(height: 250, child: Time()),
                        ),
                      );
                    },

                    content: BlocProvider.value(
                      value: bloc,
                      child: SizedBox(
                        height: context.getHeight() * 0.40,
                        width: context.getWidth() * 0.80,
                        child: Calendar(),
                      ),
                    ),
                  );
                },
                icon: Icons.timer_outlined,
              ),
              CustomIconButton(
                onPressed: () async {
                  await CustomShowDialog.show(
                    context: context,
                    blocContext: context,
                    text: AppText.addCategory,
                    onPressed: () async {
                      context.customPush(CategoryPage(bloc: bloc));
                    },
                    title: Text(
                      textAlign: TextAlign.center,
                      AppText.chooseCategory,
                      style: TextStyles.lato70016,
                    ),
                    content: BlocProvider.value(
                      value: bloc,
                      child: SizedBox(
                        width: context.getWidth() * 0.80,
                        height: context.getHeight() * 0.50,
                        child: Column(
                          children: [
                            Divider(),
                            SizedBox(height: 20),
                            ChooseCategory(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icons.local_offer_outlined,
              ),
              CustomIconButton(
                onPressed: () {
                  CustomShowDialog.show(
                    context: context,
                    blocContext: context,
                    text: AppText.save,
                    onPressed: () {},
                    title: Text(
                      textAlign: TextAlign.center,
                      AppText.priority,
                      style: TextStyles.lato70016,
                    ),
                    content: BlocProvider.value(
                      value: bloc,
                      child: SizedBox(
                        width: context.getWidth() * 0.80,
                        height: context.getHeight() * 0.35,
                        child: Column(
                          children: [
                            Divider(),
                            SizedBox(height: 20),
                            TaskPriority(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icons.flag_outlined,
              ),
              Spacer(),
              CustomIconButton(
                onPressed: () async {
                  bloc.add(AddTaskEvent());
                  context.customPop();
                },
                icon: Icons.send,
                color: AppPalette.purpleColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void show(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppPalette.lightBlack2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return BlocProvider.value(
          value: bloc,
          child: SizedBox(
            height: context.getHeight() * 0.50,
            child: CustomBottomSheet(),
          ),
        );
      },
    );
  }
}
