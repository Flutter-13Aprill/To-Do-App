import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/index_home/bloc/task_bloc.dart';
import 'package:todoapp/index_home/model/category.dart';
import 'package:todoapp/index_home/widgets/categoryColor.dart';
import 'package:todoapp/intro/widgets/next_button.dart';
import 'package:todoapp/theems/colors.dart';

class Newcategory extends StatelessWidget {
  Newcategory({super.key});

  TextEditingController Categorynamecontroller = TextEditingController();
  category? createcategory;
  Color? mycolor;
  String? selectedIcon;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<TaskBloc>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Create new category",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text("Category name :", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  TextField(
                    controller: Categorynamecontroller,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  Text("Category icon :", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: MyAppColor.gray,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              List<String> icons = [
                                "images/hospital.png",
                                "images/shopping.png",
                                "images/assignment.png",
                              ];
                              return AlertDialog(
                                backgroundColor: MyAppColor.gray,
                                title: Text("chose icon"),
                                content: Wrap(
                                  spacing: 12,
                                  children: icons.map((i) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIcon = i;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: selectedIcon == i
                                              ? MyAppColor.pur
                                              : MyAppColor.gray,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Image.asset(i, height: 20),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text(
                      "Choose icon from library",
                      style: TextStyle(color: MyAppColor.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Category color :",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: colors.map((i) {
                        return GestureDetector(
                          onTap: () {
                            mycolor = i;
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              CircleAvatar(radius: 20, backgroundColor: i),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: MyAppColor.pur),
                        ),
                      ),
                      NextButton(
                        button_text: 'Create Category',
                        onPressed: () {
                          createcategory = category(
                            Categoryname: Categorynamecontroller.text,
                            categoryimage: selectedIcon!,
                            categorycolor: mycolor!,
                          );
                          // taskcategorychose(categoryindex: createcategory!);

                          Navigator.pop(context, createcategory);
                        },
                        textColor: MyAppColor.white,
                        width: 20,
                        color: MyAppColor.pur,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
