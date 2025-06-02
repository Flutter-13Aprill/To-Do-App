import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project6/extensions/theming.dart';
import 'package:project6/models/task/task_model.dart';
import 'package:project6/repo/supabase.dart';
import 'package:project6/screens/home/bloc/home_bloc.dart';
import 'package:project6/screens/new_catagory_screen.dart';
import 'package:project6/theme/app_colors.dart';
import 'package:project6/widgets/add_task_text_field.dart';
import 'package:project6/widgets/catagory_alert.dart';
import 'package:project6/widgets/catagory_container.dart';
import 'package:project6/widgets/date_picker.dart';
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
                  title: Text('Index', style: context.titleM()),
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
                                      'Add Task',
                                      style: context.bodyM()!.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 16.h),

                                    AddTaskTextField(
                                      controller: bloc.taskController,
                                      setHint: 'Enter Task',
                                    ),
                                    SizedBox(height: 16.h),
                                    AddTaskTextField(setHint: 'Description'),

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
                                                  bloc.date = onValue;
                                                  showDialog(
                                                    context: (context),
                                                    builder: (context) {
                                                      return TimerAlert();
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
                                                List<Widget> cata = [
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'grocery';
                                                    },
                                                    setCatagory: 'Grocery',
                                                    setImage:
                                                        'assets/icons/grocery.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          204,
                                                          255,
                                                          128,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'work';
                                                    },
                                                    setCatagory: 'Work',
                                                    setImage:
                                                        'assets/icons/work.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          255,
                                                          150,
                                                          128,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'sport';
                                                    },

                                                    setCatagory: 'Sport',
                                                    setImage:
                                                        'assets/icons/sport.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          128,
                                                          255,
                                                          255,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'design';

                                                    },

                                                    setCatagory: 'Design',
                                                    setImage:
                                                        'assets/icons/sony.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          128,
                                                          255,
                                                          217,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'university';

                                                    },

                                                    setCatagory: 'University',
                                                    setImage:
                                                        'assets/icons/graduate.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          128,
                                                          156,
                                                          255,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'social';

                                                    },

                                                    setCatagory: 'Social',
                                                    setImage:
                                                        'assets/icons/microphone.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          255,
                                                          128,
                                                          235,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'music';
                                                    },

                                                    setCatagory: 'Music',
                                                    setImage:
                                                        'assets/icons/music.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          252,
                                                          128,
                                                          255,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'health';

                                                    },

                                                    setCatagory: 'Health',
                                                    setImage:
                                                        'assets/icons/heartbeat.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          128,
                                                          255,
                                                          163,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'movie';
                                                    },

                                                    setCatagory: 'Movie',
                                                    setImage:
                                                        'assets/icons/video.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          128,
                                                          209,
                                                          255,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      bloc.catagory = 'home';
                                                    },
                                                    setCatagory: 'Home',
                                                    setImage:
                                                        'assets/icons/home2.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          255,
                                                          204,
                                                          128,
                                                        ),
                                                  ),
                                                  CatagoryContainer(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                                  NewCatagoryScreen(),
                                                        ),
                                                      );
                                                    },
                                                    setCatagory: 'Create New',
                                                    setImage:
                                                        'assets/icons/plus.png',
                                                    setColor:
                                                        const Color.fromARGB(
                                                          255,
                                                          128,
                                                          255,
                                                          209,
                                                        ),
                                                  ),
                                                ];
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (context) =>
                                                          CatagoryAlert(
                                                            cata: cata,
                                                          ),
                                                );
                                                print(
                                                  'value of catagory is: ${bloc.catagory}',
                                                );
                                              },
                                              icon: Image.asset(
                                                'assets/icons/tag.png',
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (context) =>
                                                          PriortyAlert(),
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

                                            bloc.test.add(
                                              TasksContainer(
                                                setIcon:
                                                    'assets/icons/graduate.png',
                                                setTask:
                                                    bloc.taskController.text,
                                                setTime: 'Today At 4:16',
                                                setCatagory: bloc.catagory,
                                                setPriority: '1',
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
                          child: Column(spacing: 8,
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
                                    hintText: 'Search for your task...',
                                    prefixIcon: Image.asset(
                                      'assets/icons/search.png',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 150.h),

                              ...bloc.test,
                              TasksContainer(
                                setIcon: 'assets/icons/graduate.png',
                                setTask: 'Do something ',
                                setTime: 'Today At 4:16',
                                setCatagory: 'Study',
                                setPriority: '1',
                              ),
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
                                'What do you want to do today?',
                                style: context.bodyM()!.copyWith(fontSize: 20),
                              ),
                              Text('Tap + to add your tasks'),
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
