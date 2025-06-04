import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/extensions/screen/screen_size.dart';
import 'package:to_do_app/core/models/categories/categories_model.dart';
import 'package:to_do_app/core/text/app_text.dart';
import 'package:to_do_app/core/theme/app_palette.dart';
import 'package:to_do_app/features/index/widgets/categories_widgets/bloc/categories_bloc.dart';
import 'package:to_do_app/features/index/widgets/custom_dialog.dart';
import 'package:to_do_app/features/index/widgets/date_widget/bloc/calendar_bloc.dart';
import 'package:to_do_app/features/index/widgets/priority/bloc/priority_bloc.dart';
import 'package:to_do_app/features/index/bloc/task_bloc.dart';
import 'package:to_do_app/features/utilts/services/TaskService.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(create: (_) => TaskBloc(TaskService())..add(LoadTasksEvent())),
      ],
      child: Builder(
        builder: (context) {
          
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/sort.png'),
              ),
              centerTitle: true,
              title: Text(
                'Index',
                style: TextStyle(fontSize: context.getShortest(per: 0.4)),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.fill,
                    width: context.getShortest(per: 1),
                    height: context.getShortest(per: 1),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.getShortest(per: 0.17),
                  vertical: context.getShortest(per: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                       TextField(
  onChanged: (value) {
    context.read<TaskBloc>().add(SearchTasksEvent(value));
  },
  decoration: InputDecoration(
    hintText: 'Search for your Task...',
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
SizedBox(height: context.getShortest(per: 0.5)),
                   Expanded(
  child: BlocBuilder<TaskBloc, TaskState>(
    builder: (context, state) {
   

      if (state is TaskLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is TaskLoaded) {
        final filtered = state.filteredTasks;
        if (state.tasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/indexpage.png'),
                const SizedBox(height: 16),
                Text(
                  'What do you want to do today?',
                  style: TextStyle(fontSize: context.getShortest(per: 0.5)),
                ),
                Text(
                  'Tap + to add your tasks',
                  style: TextStyle(fontSize: context.getShortest(per: 0.4)),
                ),
              ],
            ),
          );
        }
        



        return ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final task = filtered[index];
            
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
      }
      return const SizedBox();
    },
  ),
),

                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                
                showDialog(
                  context: context,
                  builder: (dialogContext) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (_) => CalendarBloc()),
                      BlocProvider(create: (_) => CategoriesBloc()),
                      BlocProvider(create: (_) => PriorityBloc(),),
                      BlocProvider.value(value: context.read<TaskBloc>()),
                    ],
                    child:  AddTaskDialog(),
                  ),
                );
              },
              backgroundColor: AppPalette.purble,
              child: Icon(
                Icons.add_sharp,
                size: context.getShortest(per: 1),
                color: AppPalette.textColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
