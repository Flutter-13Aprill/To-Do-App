import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/models/category_model.dart';
import 'package:to_do_app/models/task_model.dart';

// void setup() async {
//   GetIt.I.registerSingletonAsync<AppDataLayer>(
//     () async => AppDataLayer()..loadDataFromSupabase(),
//   );
// }

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<FormService>(FormService());
  getIt.registerLazySingleton<AppData>(() => AppData());
  print("test git it ");
}

class FormService {
  late String taskName;
  late String description;
  late CategoryModel category;
  late int priority;
  late DateTime taskDate;

  TaskModel getTask() {
    return TaskModel(
      title: taskName,
      description: description,
      dateTime: taskDate,
      priority: priority,
      category: category,
    );
  }
}

class AppData extends ChangeNotifier{
  List<int> priorities = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

   List<TaskModel> tasks = [];
   List<CategoryModel> categoryList = [
    CategoryModel(
      name: 'Work',
      icon: Icon(Icons.work, color: Colors.white),
      color: Colors.blue,
    ),
    CategoryModel(
      name: 'Personal',
      icon: Icon(Icons.person, color: Colors.white ),
      color: Colors.purple,
    ),
    CategoryModel(
      name: 'Shopping',
      icon: Icon(Icons.shopping_cart, color: Colors.white),
      color: Colors.green,
    ),
    CategoryModel(
      name: 'Study',
      icon: Icon(Icons.book, color: Colors.white,),
      color: Colors.orange,
    ),
    CategoryModel(
      name: 'Health',
      icon: Icon(Icons.favorite, color: Colors.white),
      color: Colors.redAccent,
    ),
    CategoryModel(
      name: 'Travel',
      icon: Icon(Icons.flight_takeoff, color: Colors.white),
      color: Colors.teal,
    ),
    CategoryModel(
      name: 'Finance',
      icon: Icon(Icons.attach_money, color: Colors.white),
      color: Colors.indigo,
    ),
  ];

  void addTask(TaskModel task) {
    tasks.add(task);
    notifyListeners();
  }
}
