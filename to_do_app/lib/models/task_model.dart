import 'package:to_do_app/models/category_model.dart';

class TaskModel {
   int? id;
   String title;
   String description;
   DateTime dateTime;
   int priority;
   CategoryModel category;
   bool isDone;

  TaskModel(
     {
    this.id,
    this.isDone=false,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.priority,
    required this.category, 
  
  });
}
