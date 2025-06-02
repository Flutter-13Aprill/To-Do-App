import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo/core/extensions/screen_size.dart';
import 'package:uptodo/core/helpers/extensions/navigation_extensions.dart';
import 'package:uptodo/core/text/text_styles.dart';
import 'package:uptodo/core/theme/app_palette.dart';
import 'package:uptodo/core/widgets/empty_space.dart';
import 'package:uptodo/features/home/logic/bloc/tasks_bloc.dart';
import 'package:uptodo/features/home/presentation/widgets/task_textfield.dart';

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
            appBar: AppBar(title: Text('Home')),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => tasksBloc.add(PressedFloatingButton()) ,
            ),
            body: SizedBox(
              width: context.getWidth(),
              child: BlocConsumer<TasksBloc, TasksState>(
                listener: (context, state) {
                  if(state is SuccessPressingFloatingButtonState){
                    showModalBottomSheet(context: context, isScrollControlled: true ,builder: (context){
                      return Padding(
                        padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: context.getHeight(multiplied: 0.3),
                          width: context.getWidth(),
                          
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                            color: AppPalette.bottomSheetColor
                          ),
                          child: Column(
                            children: [
                        
                              EmptySpace.sizeH24,
                        
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(tr('home_screen.bottom_sheet_headline'), style: TextStyles.lato60024,)
                              ),
                        
                              EmptySpace.sizeH16,
                        
                              TaskTextfield(hintText: 'Task Name', controller: tasksBloc.taskTitleController),
                        
                              EmptySpace.sizeH16,
                        
                              TaskTextfield(hintText: 'Description', controller: tasksBloc.taskDescriptionController),
                        
                              EmptySpace.sizeH24,
                        
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 32,
                                    children: [
                                  
                                      InkWell(
                                        onTap: (){},
                                        child: SvgPicture.asset('assets/visuals/home/svgs/timer.svg'),
                                      ),
                                      
                                      InkWell(
                                        onTap: () => print('----'),
                                        child: SvgPicture.asset('assets/visuals/home/svgs/tag.svg',),
                                      ),
                                      
                                      InkWell(
                                        onTap: () => print('----'),
                                        child: SvgPicture.asset('assets/visuals/home/svgs/flag.svg',),
                                        )
                                  
                                    ],
                                  ),
                              
                                  InkWell(
                                    onTap: () => context.pop(),
                                    child: SvgPicture.asset('assets/visuals/home/svgs/send.svg'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  }
                },
                builder: (context, state) {
                  return Column(
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
                  );
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
