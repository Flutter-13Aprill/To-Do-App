import 'package:flutter/material.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/models/categories/categories_model.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/calendar/widgets/timeline.dart';
import 'package:to_do_app/features/index/bloc/task_bloc.dart';
import 'package:to_do_app/features/utilts/services/TaskService.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(TaskService())..add(LoadTasksByDateEvent(DateTime.now())),
      child: Scaffold(
        appBar: AppBar(title: const Text('Calendar')),
        body: Column(
          children: [
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                final selectedDate = state is TaskLoaded ? state.selectedDate : DateTime.now();
                return DateTimeLine(
                  selectedDate: selectedDate,
                  function: (DateTime newDate) {
                    context.read<TaskBloc>().add(LoadTasksByDateEvent(newDate));
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  if (state is TaskLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TaskLoaded) {
                    if (state.tasks.isEmpty) {
                      return const Center(child: Text('no Tasks in this Date'));
                    }
                    return ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        final task = state.tasks[index];
                        return Padding(
              padding: EdgeInsets.symmetric(vertical: context.getShortest(per:0.15),horizontal: 0),
              child: ListTile(tileColor: AppPalette.darkGrey,shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                leading: IconButton( onPressed:(){ context.read<TaskBloc>().add(FinishTasksEvent(task.id));} ,icon:Icon(state.tasks[index].isFinish? Icons.check_circle: Icons.circle_outlined,color:AppPalette.textColor)),
                title: Text(task.title,style: TextStyle(color: AppPalette.textColor,fontSize: context.getShortest(per: 0.4)),),
                subtitle: task.proccedDate == null
                    ? Text(
                        '${task.dueDate!.year}/${task.dueDate!.month}/${task.dueDate!.day}',
                        style:  TextStyle(color:AppPalette.textColor),
                      )
                    : Text(
                        task.proccedDate!,
                        style:  TextStyle(color:AppPalette.textColor),
                      ),
                trailing: SizedBox(width: context.getShortest(per: 4),height: context.getShortest(per: 1.3),
                  child: Align(alignment: Alignment.bottomRight,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(alignment: Alignment.bottomRight,height: context.getShortest(per: 0.65), decoration:BoxDecoration(color: categoriesColors[state.tasks[index].categoryId],borderRadius: BorderRadius.all(Radius.circular(context.getShortest(per: 0.1)))),child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Row(
                            children: [
                              Icon(iconsId[state.tasks[index].categoryId],size: 20),
                              SizedBox(width: 6,),
                              Text(iconsName[state.tasks[index].categoryId]!,style: TextStyle(color: AppPalette.textColor,fontSize: 12,fontWeight: FontWeight.bold))
                            ],
                          ),
                        )),SizedBox(width: 6,),
                        Container(alignment: Alignment.bottomRight,width: context.getShortest(per: 1.3),height: context.getShortest(per: 0.65), decoration:BoxDecoration(color:Colors.transparent ,border: Border.all(color:AppPalette.lightPurble),borderRadius: BorderRadius.all(Radius.circular(context.getShortest(per: 0.2)))),child:  Row(
                          children: [
                            Icon(Icons.flag_outlined,size: 20,),
                            SizedBox(width: 6,),
                            Text(state.tasks[index].priority.toString(),style: TextStyle(color: AppPalette.textColor, fontSize: 12,fontWeight: FontWeight.bold),)
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            );
                      },
                    );
                  } else if (state is TaskError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
Padding(
              padding: EdgeInsets.symmetric(vertical: context.getShortest(per:0.15),horizontal: 0),
              child: ListTile(tileColor: AppPalette.darkGrey,shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                leading: IconButton( onPressed:(){ context.read<TaskBloc>().add(FinishTasksEvent(task.id));} ,icon:Icon(state.tasks[index].isFinish? Icons.check_circle: Icons.circle_outlined,color:AppPalette.textColor)),
                title: Text(task.title,style: TextStyle(color: AppPalette.textColor,fontSize: context.getShortest(per: 0.4)),),
                subtitle: task.proccedDate == null
                    ? Text(
                        '${task.dueDate!.year}/${task.dueDate!.month}/${task.dueDate!.day}',
                        style:  TextStyle(color:AppPalette.textColor),
                      )
                    : Text(
                        task.proccedDate!,
                        style:  TextStyle(color:AppPalette.textColor),
                      ),
                trailing: SizedBox(width: context.getShortest(per: 4),height: context.getShortest(per: 1.3),
                  child: Align(alignment: Alignment.bottomRight,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(alignment: Alignment.bottomRight,height: context.getShortest(per: 0.65), decoration:BoxDecoration(color: categoriesColors[state.tasks[index].categoryId],borderRadius: BorderRadius.all(Radius.circular(context.getShortest(per: 0.1)))),child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Row(
                            children: [
                              Icon(iconsId[state.tasks[index].categoryId],size: 20),
                              SizedBox(width: 6,),
                              Text(iconsName[state.tasks[index].categoryId]!,style: TextStyle(color: AppPalette.textColor,fontSize: 12,fontWeight: FontWeight.bold))
                            ],
                          ),
                        )),SizedBox(width: 6,),
                        Container(alignment: Alignment.bottomRight,width: context.getShortest(per: 1.3),height: context.getShortest(per: 0.65), decoration:BoxDecoration(color:Colors.transparent ,border: Border.all(color:AppPalette.lightPurble),borderRadius: BorderRadius.all(Radius.circular(context.getShortest(per: 0.2)))),child:  Row(
                          children: [
                            Icon(Icons.flag_outlined,size: 20,),
                            SizedBox(width: 6,),
                            Text(state.tasks[index].priority.toString(),style: TextStyle(color: AppPalette.textColor, fontSize: 12,fontWeight: FontWeight.bold),)
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            );
*/