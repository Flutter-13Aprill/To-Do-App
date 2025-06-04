import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/core/text/text_styles.dart';
import 'package:project6/core/theme/app_palette.dart';
import 'package:project6/feature/home/data/model/task_data/task_data_model.dart';
import 'package:project6/feature/home/presentation/bloc/home_bloc.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key, required this.tasks});
final List<TaskDataModel> tasks;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();

        return ListView.builder(
          itemCount: bloc.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(bloc.tasks[index].task, style: TextStyles.lato40016),
              subtitle: Text(
                bloc.tasks[index].description,
                style: TextStyles.lato40014,
              ),
              leading: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: BoxBorder.all(color: Colors.white),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 29,
                    width: 42,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: AppPalette.lightPurple),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          size: 35,
                          color: AppPalette.whiteColor,
                        ),
                        Text(bloc.tasks[index].priority.toString()),
                      ],
                    ),
                  ),
                  Icon(Icons.ac_unit_rounded),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
