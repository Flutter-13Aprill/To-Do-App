// import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp/index_home/bloc/task_bloc.dart';
import 'package:todoapp/index_home/model/category.dart';
import 'package:todoapp/index_home/model/task.dart';
import 'package:todoapp/index_home/screens/edit.dart';
import 'package:todoapp/index_home/screens/newcategory.dart';
import 'package:todoapp/index_home/widgets/add_task_bottomsheet.dart';
import 'package:todoapp/intro/widgets/next_button.dart';
import 'package:todoapp/theems/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<TaskBloc>();
          return Scaffold(
            //appbar
            appBar: AppBar(
              title: Text(
                "index".tr(),
                style: TextStyle(color: MyAppColor.white),
              ),
              centerTitle: true,
              leading: Icon(Icons.filter_list, color: MyAppColor.white),
              actions: [
                CircleAvatar(
                  child: Image.asset("images/avtar.png"),
                  radius: 30,
                ),
              ],
            ),

            //flotingbutton
            floatingActionButton: FloatingActionButton(
              backgroundColor: MyAppColor.pur,
              shape: CircleBorder(),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: MyAppColor.gray,
                  context: context,
                  builder: (_) {
                    return BlocProvider.value(
                      value: bloc,
                      child: AddTaskBottomsheet(),
                    );
                  },
                );
              },
              child: Icon(Icons.add, color: MyAppColor.white),
            ),

            body: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(10),

                  //searchbar
                  child: SearchBar(
                    leading: Icon(
                      Icons.search_outlined,
                      size: 35,
                      color: MyAppColor.white.withOpacity(0.7),
                    ),
                    hintText: "serch_task".tr(),
                    hintStyle: MaterialStateProperty.all(
                      TextStyle(
                        color: MyAppColor.white.withOpacity(0.7),
                        fontSize: 18,
                      ),
                    ),
                    elevation: WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(
                      MyAppColor.gray.withOpacity(0.5),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        side: BorderSide(
                          color: MyAppColor.white.withOpacity(0.7),
                        ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),

                    onChanged: (value) {
                      bloc.add(UpdateSearchQuery(searchtext: value));
                    },
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final user = Supabase.instance.client.auth.currentUser;
                    print(user!.email);
                    print(user!.id);
                  },
                  child: Text("totry"),
                ),
                Expanded(
                  child: BlocBuilder<TaskBloc, TaskLoadedState>(
                    builder: (context, state) {
                      if (state is TaskLoadedState) {
                        if (state.tasks.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/empttasks.png"),
                                SizedBox(height: 20),
                                Text("what_do_you_want".tr()),
                                SizedBox(height: 20),
                                Text("tap".tr()),
                              ],
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: state.tasks.length,
                            itemBuilder: (context, index) {
                              final task = state.tasks[index];
                              return GestureDetector(
                                // on tap on the card
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Edit(desc: task.description, date: task.day, priority: task.priority, time: task.time, categor: task.categor,title: task.title,),
                                    ),
                                  );
                                },
                                //card shape
                                child: Card(
                                  color: MyAppColor.gray,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                bloc.add(
                                                  ToggleTaskCompletion(
                                                    index: index,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: task.isCompleted
                                                        ? Colors.green
                                                        : Colors.white,
                                                    width: 2,
                                                  ),
                                                  color: task.isCompleted
                                                      ? Colors.green
                                                      : Colors.transparent,
                                                ),
                                                child: task.isCompleted
                                                    ? Icon(
                                                        Icons.check,
                                                        size: 14,
                                                        color: Colors.white,
                                                      )
                                                    : null,
                                              ),
                                            ),
                                            Expanded(
                                              child: ListTile(
                                                title: Text(
                                                  task.title,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyAppColor.white,
                                                    decoration: task.isCompleted
                                                        ? TextDecoration
                                                              .lineThrough
                                                        : null,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  "${task.day} At${task.time}",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(width: 10),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(width: 12),
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 6,
                                                        ),
                                                    height:
                                                        50, /////////////////////////////
                                                    decoration: BoxDecoration(
                                                      color: task
                                                          .categor
                                                          .categorycolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4,
                                                          ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          task
                                                              .categor
                                                              .categoryimage,
                                                        ),
                                                        SizedBox(width: 12),
                                                        Text(
                                                          task
                                                              .categor
                                                              .Categoryname,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 20),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 6,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: MyAppColor.pur,
                                                  ),
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "images/flag.png",
                                                    ),
                                                    Text(
                                                      "${task.priority + 1}",
                                                    ),
                                                  ],
                                                ),
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
                          );
                        }
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
