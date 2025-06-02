import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/extension/git_size_screen.dart';
import 'package:project6/core/text/app_text.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/core/widget/button/custom_Icon_button.dart';
import 'package:project6/core/widget/custom_show_dialog.dart';
import 'package:project6/core/widget/custom_text_field.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';

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
                onPressed: () {
                  CustomShowDialog.show(
                    context,
                    text: AppText.save,
                    onPressed: () {},
                    title: AppText.priority,
                    content: Divider(),
                  );
                  // Calendar.selectDate(context);
                },
                icon: Icons.timer_outlined,
              ),
              CustomIconButton(
                onPressed: () {},
                icon: Icons.location_on_outlined,
              ),
              CustomIconButton(
                onPressed: () {
                  CustomShowDialog.show(
                    context,
                    text: AppText.save,
                    onPressed: () {},
                    title: AppText.priority,
                    content: Divider(),
                  );
                },
                icon: Icons.flag_outlined,
              ),
              Spacer(),
              CustomIconButton(
                onPressed: () {
                  bloc.add(AddTaskEvent());
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
