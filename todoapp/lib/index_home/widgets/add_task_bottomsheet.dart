import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/index_home/bloc/task_bloc.dart';
import 'package:todoapp/index_home/model/category.dart';
import 'package:todoapp/index_home/model/task.dart';
import 'package:todoapp/index_home/screens/newcategory.dart';
import 'package:todoapp/intro/widgets/next_button.dart';
import 'package:todoapp/theems/colors.dart';

class AddTaskBottomsheet extends StatelessWidget {
  AddTaskBottomsheet({super.key});

  DateTime? selectedate;
  //عشانهم بياخذون القيمة من فنكشن
  TimeOfDay? selectetime;

  final titleController = TextEditingController();

  final descCSontroller = TextEditingController();

  int selectedpr = 0;

  category? selectedcategory;

  final List<String> Priority = List.generate(10, (index) => "${index + 1}");

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TaskBloc>();
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Add Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 18),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyAppColor.white.withOpacity(0.5),
                  ),
                ),
                hintText: "Do math homework",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descCSontroller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyAppColor.white.withOpacity(0.5),
                  ),
                ),
                hintText: "Description",
              ),
            ),

            SizedBox(height: 30),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    DateTime selectedDate = DateTime.now();
                    showDialog(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: bloc,
                        child: AlertDialog(
                          backgroundColor: const Color(0xFF2C2C2C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: EdgeInsets.zero,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 300,
                                width: 200,
                                child: CalendarDatePicker(
                                  initialDate: selectedDate,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  onDateChanged: (value) {
                                    selectedate = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  bottom: 16,
                                  top: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// Cancel
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),

                                    ///Choose Time
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: MyAppColor.pur,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        // selectedate = selectedDate;
                                        // Navigator.pop(context);

                                        TimeOfDay?
                                        pickTime = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                timePickerTheme:
                                                    TimePickerThemeData(
                                                      dialHandColor:
                                                          MyAppColor.pur,
                                                      dialBackgroundColor:
                                                          MyAppColor.white,
                                                      backgroundColor:
                                                          MyAppColor.black,
                                                      hourMinuteTextColor:
                                                          MyAppColor.white,
                                                    ),
                                                textButtonTheme:
                                                    TextButtonThemeData(
                                                      style:
                                                          TextButton.styleFrom(
                                                            foregroundColor:
                                                                MyAppColor.pur,
                                                          ),
                                                    ),
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );
                                        selectetime = pickTime;
                                      },
                                      child: Text("Choose Time"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Image.asset("images/timer.png"),
                ),

                SizedBox(width: 30),

                // category
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,

                      builder: (_) => Dialog(
                        backgroundColor: MyAppColor.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(3),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Choose Category",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                              Divider(),
                              SizedBox(height: 10),
                              Wrap(
                                spacing: 40,
                                runSpacing: 40,
                                children: categoris.map((i) {
                                  return GestureDetector(
                                    onTap: () async {
                                      if (i.Categoryname == "Create New") {
                                        final NewCategory =
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Newcategory(),
                                              ),
                                            );
                                        selectedcategory = NewCategory;
                                        return;
                                      } else {
                                        selectedcategory = i;
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          // color: i.categorycolor,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                            color: i.categorycolor,
                                          ),
                                          child: Image.asset(
                                            i.categoryimage,
                                            height: 16,
                                            width: 12,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(i.Categoryname),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 13),
                              NextButton(
                                button_text: "Add Category",
                                onPressed: () {
                                  if (selectedcategory != null) {
                                    bloc.add(
                                      taskcategorychose(
                                        categoryindex: selectedcategory!,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  }
                                },
                                color: MyAppColor.pur,
                                textColor: MyAppColor.white,
                                width: 300,
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Image.asset("images/tag.png"),
                ),
                SizedBox(width: 30),

                

                // Priority
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: bloc,
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text("Task Priority"),
                              backgroundColor: MyAppColor.gray,
                              content: StatefulBuilder(
                                builder: (context, setState) {
                                  return Wrap(
                                    spacing: 8,
                                    runSpacing: 12,
                                    children: Priority.map((i) {
                                      final index = Priority.indexOf(i);
                                      final isSelected = selectedpr == index;

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedpr = index;
                                          });
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? MyAppColor.pur
                                                : Colors.grey.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                              3,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 10),
                                              Image.asset("images/flag.png"),
                                              Text(
                                                i,
                                                style: TextStyle(
                                                  color: MyAppColor.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    NextButton(
                                      button_text: "Cancel",
                                      onPressed: () {
                                        bloc.add(
                                          TaskPrioritychose(
                                            Priorityindex: selectedpr,
                                          ),
                                        );
                                        Navigator.pop(context);
                                      },
                                      textColor: MyAppColor.pur,
                                      width: 40,
                                      color: Colors.transparent,
                                    ),
                                    SizedBox(width: 30),
                                    NextButton(
                                      button_text: "Save",
                                      onPressed: () => Navigator.pop(context),
                                      textColor: MyAppColor.white,
                                      width: 40,
                                      color: MyAppColor.pur,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Image.asset("images/flag.png"),
                ),

                Spacer(),

                // send
                InkWell(
                  onTap: () {
                    final state = context.read<TaskBloc>().state;
                    if (state is TaskLoadedState && selectedcategory != null) {
                      final task = Task(
                        //ياخذ القيم اللي بيرسلهم من هذي الصفحة اخذ الاسم والدسكريبشن
                        title: titleController.text.trim(),
                        description: descCSontroller.text.trim(),
                        priority: state.selectedPriority ?? 0,
                        categor: state.selectedCategory!,
                        day: selectedate!,
                        time: selectetime!,
                      );
                      print("done${task.title}");
                      bloc.add(AddTaskevent(task: task));
                      Navigator.pop(context);
                    }
                  },
                  child: Image.asset("images/send.png"),
                ),
                SizedBox(width: 10),
              ],
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
