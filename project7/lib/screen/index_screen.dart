import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project7/controller/validator.dart';
import 'package:project7/utilit/setup.dart';
import 'package:project7/widget/custom_calendar.dart';
import 'package:project7/widget/custom_prior.dart';
import 'package:project7/widget/custom_time.dart';
import 'package:intl/intl.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project7/repo/supabase.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  List<String> todoList = []; //to store tasks name
  List<String> todoDescription = []; //to store description
  // CustomCalendar calendar = CustomCalendar();

  addList(String task) {
    setState(() {
      todoList.add(task);
      validator.taskController.clear();
    });
  }

  addDescrip(String task) {
    setState(() {
      todoDescription.add(task);
      validator.taskDescription.clear();
    });
  }

  Validator validator = Validator();

  final controller = Validator();
  final _keyForm = GlobalKey<FormState>();
  int updateIndex = -1;

  @override
  Widget build(BuildContext context) {
    String searchText = "";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Index", style: TextStyle(color: Colors.white)),
        actions: [Image.asset("assets/images/user.png", height: 70)],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,

      body: Form(
        key: _keyForm,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedSearchBar(
                label: "Search for your task",

                labelStyle: TextStyle(color: Colors.grey),
                onChanged: (value) {
                  debugPrint("value on Change");
                  setState(() {
                    searchText = value;
                  });
                },
              ),
            ),
            todoList.isEmpty
                ? Center(
                    child: Column(
                      children: [
                        SizedBox(height: 60),
                        Image.asset("assets/images/checklist.png"),
                        Text(
                          "What do you want to do today?",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          "Tap + to add your tasks",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),

                          // Card background color
                          color: Color(0xFF363636),
                          child: Container(
                            height: 100,
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      todoList[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      todoDescription[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(height: 180),

            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 136, 117, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),

                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 40,
                        width: 20,
                        // padding: EdgeInsets.all(0),
                        child: Dialog(
                          backgroundColor: Color(0xFF363636),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 170.0,
                                  top: 10,
                                ),
                                child: Text(
                                  "Add Task",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              Container(
                                width: 230,

                                child: TextFormField(
                                  enabled: true,
                                  controller: validator.taskController,
                                  // validator: Validator.validatePassword,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    hintText: "Enter task name",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 230,
                                child: TextFormField(
                                  enabled: true,
                                  controller: validator.taskDescription,
                                  // validator: Validator.validatePassword,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    hintText: "Enter task decription",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF363636),
                                      shape: RoundedRectangleBorder(),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => Dialog(
                                          backgroundColor: Colors.black,
                                          insetPadding: const EdgeInsets.all(
                                            16,
                                          ),
                                          child: SingleChildScrollView(
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                maxHeight:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.height *
                                                    0.7,
                                                maxWidth:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width *
                                                    0.9,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  16,
                                                ),
                                                ///////////////////////////////////////////////////////////////////
                                                child: CustomCalendar(
                                                  onDateSelected: (date) {
                                                    Navigator.pop(context);
                                                  },
                                                  // onDateSelected: (date) {
                                                  //   setState(() {
                                                  //     selectedDate = date;
                                                  //   });
                                                  //   Navigator.pop(context);
                                                  // },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                    child: FaIcon(
                                      FontAwesomeIcons.clock,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF363636),
                                      shape: RoundedRectangleBorder(),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,

                                        builder: (ctx) => Dialog(
                                          backgroundColor: Color(0xFF363636),
                                          insetPadding: const EdgeInsets.all(
                                            16,
                                          ),
                                          child: SingleChildScrollView(
                                            child: SizedBox(
                                              height: 400,
                                              width: 150,
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  16,
                                                ),
                                                child: CustomTime(
                                                  onTimeSelected: (p0) => (),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                    child: FaIcon(
                                      FontAwesomeIcons.tag,
                                      color: Colors.white,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF363636),
                                      shape: RoundedRectangleBorder(),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => Dialog(
                                          backgroundColor: Colors.black,
                                          insetPadding: const EdgeInsets.all(
                                            16,
                                          ),
                                          child: SingleChildScrollView(
                                            child: SizedBox(
                                              height: 390,
                                              width: 370,
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  16,
                                                ),

                                                child: CustomPrior(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                    child: FaIcon(
                                      FontAwesomeIcons.flag,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 90),
                                  InkWell(
                                    onTap: () {
                                      final repo = getIt<SupabaseRepo>();
                                      final title =
                                          validator.taskController.text;
                                      final description =
                                          validator.taskDescription.text;
                                      updateIndex != -1;
                                      addList(
                                        validator.taskController.text,
                                      ); // Add new task
                                      addDescrip(
                                        validator.taskDescription.text,
                                      );
                                      repo.addTaskSupabase(title, description);
                                    },
                                    child: Image.asset(
                                      "assets/images/send.png",
                                    ),
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
                child: const Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
