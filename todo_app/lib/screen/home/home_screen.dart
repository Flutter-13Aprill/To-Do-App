import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/screen/home/bloc/home_bloc.dart';
import 'package:todo_app/screen/tasks/tasks_screen.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_main_text.dart';
import 'package:todo_app/widget/custom_scond_text.dart';
import 'package:todo_app/widget/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<HomeBloc>();
          return BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is TaskAddedSuccessState) {
                bloc.add(LodTasksEvent());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TasksScreen(homeBloc: bloc),
                  ),
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('done')));
              } else if (state is TaskAddedErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('there is error')));
              }
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/sort.svg',
                    height: 24,
                    width: 24,
                  ),
                ),
                title: CustomMainText(color: ColorsApp.white, text: 'Index'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/persona.png'),
                      radius: 18,
                    ),
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 227,
                      width: 227,
                      child: Image.asset(
                        'assets/images/Checklist-rafiki 1.png',
                      ),
                    ),
                    SizedBox(height: 24),
                    CustomMainText(
                      textAlign: TextAlign.center,
                      fontSize: 20,
                      text: 'What do you want to do today?',
                    ),
                    SizedBox(height: 24),
                    CustomScondText(text: 'Tap + to add your tasks'),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: ColorsApp.cardColors,
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder:
                        (context) => SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                              left: 16,
                              right: 16,
                              top: 24,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomMainText(
                                  color: ColorsApp.white,
                                  text: 'Add Task',
                                  fontSize: 18,
                                ),
                                SizedBox(height: 16),
                                CustomTextField(
                                  hintText: 'Title',
                                  onChanged: (p0) {},
                                  controller: bloc.titleController,
                                ),
                                SizedBox(height: 12),
                                CustomTextField(
                                  hintText: 'Description',
                                  onChanged: (p0) {},
                                  controller: bloc.descriptionController,
                                  // maxLines: 3,
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showDatePicker(
                                          context: context,
                                          firstDate: DateTime(1995),
                                          lastDate: DateTime.now().add(
                                            Duration(days: 365),
                                          ),
                                        );
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/icons/timer.svg',
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/tag.svg',
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/flag.svg',
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        bloc.add(
                                          AddTaskEvent(
                                            title: bloc.titleController.text,
                                            description:
                                                bloc.descriptionController.text,
                                          ),
                                        );
                                        Navigator.pop(context);
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/icons/send.svg',
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                  );
                },
                shape: CircleBorder(),
                backgroundColor: ColorsApp.primary,
                child: Icon(Icons.add, color: ColorsApp.white),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            ),
          );
        },
      ),
    );
  }
}
