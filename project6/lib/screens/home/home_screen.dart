import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';

import 'package:project6/screens/home/bloc/home_bloc.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/add_task_text_field.dart';
import 'package:project6/widgets/catagory_alert.dart';
import 'package:project6/widgets/priorty_alert.dart';
import 'package:project6/widgets/tasks_container.dart';
import 'package:project6/widgets/timer_alert.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Builder(
            builder: (context) {
              final bloc = context.read<HomeBloc>();

              return Scaffold(
                appBar: AppBar(
                  leading: Image.asset('assets/icons/drawer.png'),
                  title: Text('index'.tr(), style: context.titleM()),
                  centerTitle: true,
                  actions: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/images/profile_home.png'),
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColors().buttonColor,
                  shape: CircleBorder(),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder:
                          (context) => Container(
                            width: 426.w,
                            height: 500.h,
                            decoration: BoxDecoration(
                              color: AppColors().alertBackgroundColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: UnconstrainedBox(
                              child: Container(
                                width: 390,
                                height: 470,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'addTask'.tr(),
                                      style: context.bodyM()!.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 16.h),

                                    AddTaskTextField(
                                      controller: bloc.taskController,
                                      setHint: 'enterTask'.tr(),
                                    ),
                                    SizedBox(height: 16.h),
                                    AddTaskTextField(setHint: 'description'.tr()),

                                    //may cause a problem during showing keyboard need to be double checked ***************
                                    SizedBox(height: 175.h),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          spacing: 16,

                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // need to add date picker with time alert

                                                showDatePicker(
                                                  context: context,
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2100),
                                                ).then((onValue) {
                                                  if (onValue == null) {
                                                    bloc.date = DateTime.now();
                                                  }
                                                  bloc.date = onValue;
                                                  showDialog(
                                                    context: (context),
                                                    builder: (context) {
                                                      return BlocProvider.value(
                                                        value: bloc,
                                                        child: TimerAlert(),
                                                      );
                                                    },
                                                  );
                                                  print(bloc.date);
                                                });
                                              },
                                              icon: Image.asset(
                                                'assets/icons/timer.png',
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                //need to be implemented didn't understand how to make it to prefered format ****************************

                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (
                                                        context,
                                                      ) => BlocProvider.value(
                                                        value: bloc,
                                                        child: CatagoryAlert(
                                                          cata:
                                                              bloc
                                                                  .appDataGetIt
                                                                  .categories,
                                                        ),
                                                      ),
                                                );
                                              },
                                              icon: Image.asset(
                                                'assets/icons/tag.png',
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                print(
                                                  'value of catagory is: ${bloc.catagory.category}',
                                                );
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (
                                                        context,
                                                      ) => BlocProvider.value(
                                                        value: bloc,
                                                        child: PriortyAlert(
                                                          priority:
                                                              bloc
                                                                  .appDataGetIt
                                                                  .priority,
                                                        ),
                                                      ),
                                                );
                                              },
                                              icon: Image.asset(
                                                'assets/icons/flag.png',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 35.w),
                                        IconButton(
                                          onPressed: () {
                                            print(bloc.catagory);

                                            bloc.add(SupaEvent());
                                            Navigator.pop(context);
                                            bloc.todos.add(
                                              BlocProvider.value(
                                                value: bloc,
                                                child: TasksContainer(
                                                  
                                                  setColors:
                                                      bloc.catagory.color,
                                                  setIcon: bloc.catagory.icon,
                                                  date: bloc.date!,
                                                  setTask:
                                                      bloc.taskController.text,
                                                  setTime: bloc.timer,
                                                  setCatagory:
                                                      bloc.catagory.category,

                                                  setPriority: bloc.priorty,
                                                ),
                                              ),
                                            );
                                            bloc.add(AddEvent());
                                          },
                                          icon: Image.asset(
                                            'assets/icons/send.png',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    );
                  },
                  child: Icon(Icons.add, color: Colors.white),
                ),
                body:
                    bloc.hasValue >= 1
                        ? Center(
                          child: Column(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 400..w,
                                height: 48.h,

                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),

                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    hintText: 'searchBar'.tr(),
                                    prefixIcon: Image.asset(
                                      'assets/icons/search.png',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25.h),

                              ...bloc.todos,
                          
                            ],
                          ),
                        )
                        : Center(
                          child: Column(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/home_image.png'),
                              Text(
                                'whatToDo'.tr(),
                                style: context.bodyM()!.copyWith(fontSize: 20),
                              ),
                              Text('tabPlus').tr(),
                            ],
                          ),
                        ),
              );
            },
          );
        },
      ),
    );
  }
}
