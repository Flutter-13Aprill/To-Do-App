// import 'package:to_do_app/models/category_model.dart';

// class TaskModel {
//  int? id;
//  String title;
//  String description;
//  DateTime dateTime;
//  int priority;
//  CategoryModel category;
//  bool isDone;

//   TaskModel(
//      {
//     this.id,
//     this.isDone=false,
//     required this.title,
//     required this.description,
//     required this.dateTime,
//     required this.priority,
//     required this.category,

//   });
// }
import 'package:to_do_app/models/category_model.dart';

class TaskModel {
  int? id;
  String title;
  String description;
  DateTime dateTime;
  int priority;
  // int categoryId;
  bool isDone;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.priority,
    // required this.categoryId,
    required this.isDone,
  });

  Map<String, dynamic> toJson(int userId) => {
    "title": title,
    "description": description,
    "datetime": dateTime.toIso8601String(),
    "priority": priority,
    // "categoryId": categoryId,
    "isdone": isDone,
    "user_id": userId,
  };

  static TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"] as int,
      title: json["title"],
      description: json["description"],
      dateTime: DateTime.parse(json["datetime"]),
      priority: json["priority"] as int,
      // categoryId: int.parse(json["categoryId"]) ,
      isDone: json["isdone"],
    );
  }
}
