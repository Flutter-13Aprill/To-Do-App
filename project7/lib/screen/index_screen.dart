import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project7/controller/validator.dart';
import 'package:project7/widget/custom_calendar.dart';
import 'package:project7/widget/custom_prior.dart';
import 'package:project7/widget/custom_time.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final controller = Validator();
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Form(
        key: _keyForm,

        child: Center(
          child: Column(
            children: [
              SizedBox(height: 270),
              Image.asset("assets/images/checklist.png"),
              Text(
                "What do you want to do today?",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Text(
                "Tap + to add your tasks",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 220),

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
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
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
                                    obscureText: true,
                                    enabled: true,
                                    controller: controller.task,
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
                                    obscureText: true,
                                    enabled: true,
                                    controller: controller.taskDescription,
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
                                                  child: CustomCalendar(),
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
      ),
    );
  }
}
