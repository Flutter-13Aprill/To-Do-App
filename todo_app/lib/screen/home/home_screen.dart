import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo_app/screen/home/bloc/home_bloc.dart';
import 'package:todo_app/screen/tasks/tasks_screen.dart';
import 'package:todo_app/theme/colors_app.dart';
import 'package:todo_app/widget/custom_button.dart';
import 'package:todo_app/widget/custom_content_catagory.dart';
import 'package:todo_app/widget/custom_main_text.dart';
import 'package:todo_app/widget/custom_priority.dart';
import 'package:todo_app/widget/custom_scond_text.dart';
import 'package:todo_app/widget/custom_text_button.dart';
import 'package:todo_app/widget/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Builder(
    // builder: (context) {
    final bloc = context.read<HomeBloc>();

    return Scaffold(
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
              child: Image.asset('assets/images/Checklist-rafiki 1.png'),
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
            backgroundColor: ColorsApp.text,
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: ColorsApp.text,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      title: CustomMainText(
                                        color: ColorsApp.white,
                                        text: 'Select Date',
                                        fontSize: 16,
                                      ),
                                      content: SizedBox(
                                        height: 300,
                                        width: 300,
                                        child: SfDateRangePicker(
                                          onSelectionChanged: (
                                            DateRangePickerSelectionChangedArgs
                                            args,
                                          ) {
                                            bloc.selectedDate = args.value;
                                          },
                                          selectionMode:
                                              DateRangePickerSelectionMode
                                                  .single,
                                          selectionColor: ColorsApp.primary,
                                          todayHighlightColor: ColorsApp.white,
                                          backgroundColor: ColorsApp.text,
                                          headerStyle:
                                              DateRangePickerHeaderStyle(
                                                backgroundColor:
                                                    ColorsApp.primary,
                                                textStyle: TextStyle(
                                                  color: ColorsApp.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                          monthCellStyle:
                                              DateRangePickerMonthCellStyle(
                                                todayTextStyle: TextStyle(
                                                  color: ColorsApp.primary,
                                                ),
                                                todayCellDecoration:
                                                    BoxDecoration(
                                                      color: ColorsApp.white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                textStyle: TextStyle(
                                                  color: ColorsApp.white,
                                                ),
                                              ),
                                        ),
                                      ),
                                      actions: [
                                        CustomTextButton(
                                          onPressed: () {},
                                          fontSize: 16,
                                          text: 'Cancel',
                                        ),
                                        CustomButton(
                                          onPressed: () async {
                                            final time = await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            );
                                            if (time != null &&
                                                bloc.selectedDate != null) {
                                              final selectedDate =
                                                  bloc.selectedDate!;
                                              final fullDateTime = DateTime(
                                                selectedDate.year,
                                                selectedDate.month,
                                                selectedDate.day,
                                                time.hour,
                                                time.minute,
                                              );
                                              bloc.selectedDate = fullDateTime;
                                              bloc.add(
                                                SelectDateTimeEvent(
                                                  fullDateTime,
                                                ),
                                              );
                                              Navigator.pop(context);
                                            }
                                          },
                                          text: "Choose Time",
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/timer.svg',
                                height: 24,
                                width: 24,
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: ColorsApp.cardColors,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      title: Text(
                                        'Choose Category',
                                        style: TextStyle(
                                          color: ColorsApp.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      content: CustomContentCatagory(),
                                      actions: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: CustomButton(
                                            text: 'Add Category',
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/tag.svg',
                                height: 24,
                                width: 24,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BlocProvider.value(
                                      value: context.read<HomeBloc>(),
                                      child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        backgroundColor: ColorsApp.cardColors,
                                        title: Text(
                                          'Task Priority',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorsApp.white,
                                          ),
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            BlocBuilder<HomeBloc, HomeState>(
                                              builder: (context, state) {
                                                final bloc =
                                                    context.read<HomeBloc>();

                                                return Wrap(
                                                  spacing: 12,
                                                  runSpacing: 12,
                                                  children: List.generate(
                                                    6,
                                                    (index) => GestureDetector(
                                                      onTap: () {
                                                        bloc.add(
                                                          SelectPriorityEvent(
                                                            index + 1,
                                                          ),
                                                        );
                                                      },
                                                      child: CustomPriority(
                                                        text: '${index + 1}',
                                                        isSelected:
                                                            bloc.selectedPriority ==
                                                            index + 1,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 24),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CustomTextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  fontSize: 16,
                                                  text: 'Cancel',
                                                ),

                                                CustomButton(
                                                  text: 'save',
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/flag.svg',
                                height: 24,
                                width: 24,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                bloc.add(AddTaskEvent());
                                Navigator.pop(context);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => TasksScreen(),
                                  ),
                                );
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
    //   },
    // );
  }
}



// return BlocListener<HomeBloc, HomeState>(
          //   listener: (context, state) {
    
          //   },   );
          // if (state is TaskAddedSuccessState) {
              //   bloc.add(LodTasksEvent());
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => TasksScreen(homeBloc: bloc),
              //     ),
              //   );
              //   ScaffoldMessenger.of(
              //     context,
              //   ).showSnackBar(SnackBar(content: Text('done')));
              // } else if (state is TaskAddedErrorState) {
              //   ScaffoldMessenger.of(
              //     context,
              //   ).showSnackBar(SnackBar(content: Text('there is error')));
              // }


              //  if (bloc.selectedDate !=
              //                                             null &&
              //                                         bloc.selectedDate
              //                                             is DateTime) {
              //                                       final TimeOfDay?
              //                                       pickedTime =
              //                                           await showTimePicker(
              //                                             context: context,
              //                                             initialTime:
              //                                                 TimeOfDay.now(),
              //                                           );
              //                                       if (pickedTime != null) {
              //                                         bloc.add(
              //                                           SelectTaskTimeEvent(
              //                                             pickedTime,
              //                                           ),
              //                                         );
              //                                       }
              //                                     }
              //                                     Navigator.pop(context);