import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            final selectedPriority = state is TaskPrioritySelected
                ? state.priority
                : null;
            final isSelected = selectedPriority == index + 1;

            return InkWell(
              onTap: () {
                bloc.add(TaskPriorityEvent(taskPriority: index + 1));
              },
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppPalette.purpleColor
                      : AppPalette.lightBlack3,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flag_outlined,
                      size: 35,
                      color: AppPalette.whiteColor,
                    ),
                    Text("${index + 1}", style: TextStyles.lato40016),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
