import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/extensions/screen_size.dart';

import 'package:uptodo/core/text/text_styles.dart';

import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/home/logic/bloc/tasks_bloc.dart';
import 'package:uptodo/features/home/presentation/widgets/task_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: Builder(
        builder: (context) {
          final tasksBloc = context.read<TasksBloc>();

          return Scaffold(
            appBar: AppBar(title: Text(tr('home_screen.app_bar_title'))),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                tasksBloc.add(ToAddTaskEvent());
              },
            ),
            body: BlocListener<TasksBloc, TasksState>(
              listener: (listenerContext, state) {
                
                if(state is ToShowAddTaskDialog){

                  var bloc = listenerContext.read<TasksBloc>();
                  showModalBottomSheet(
                    context: listenerContext, 
                    builder: (listenerContext){
                      return BlocProvider.value(
                        value: bloc,
                        child: TaskBottomSheet(),
                      );
                    }
                  );
                }
              },
              child: SizedBox(
                width: context.getWidth(),
                child: Column(
                  children: [
                    EmptySpace.sizeH72,

                    SvgPicture.asset('assets/visuals/home/svgs/empty_list.svg'),

                    EmptySpace.sizeH8,

                    Text(
                      tr('home_screen.empty_list_title'),
                      style: TextStyles.lato60024,
                    ),

                    EmptySpace.sizeH8,

                    Text(
                      tr('home_screen.empty_list_subtitle'),
                      style: TextStyles.lato40018,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
