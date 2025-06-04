import 'package:to_do_app/models/category_model.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/repo/supabase.dart';

class AppDataLayer {
  List<TaskModel> tasks = [];

  loadDataFromSupabase() async {
    tasks = await SupabaseConnect.getTasks();
    print("task length ${tasks.length}");
  }
  
  addNewTask({required TaskModel task}) async {
    try {
      final newTask = await SupabaseConnect.addTask(task: task);
      if (newTask == null) {
        return true;
      }
      return false;
    } catch (_) {
      rethrow;
    }
  }

  List<int> priorities = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<CategoryModel> categoryList = [
    CategoryModel(name: "Work", iconName: "work", colorHex: "#FF5722"),
    CategoryModel(name: "Personal", iconName: "person", colorHex: "#3F51B5"),
    CategoryModel(
      name: "Shopping",
      iconName: "shopping_cart",
      colorHex: "#4CAF50",
    ),
    CategoryModel(
      name: "Health",
      iconName: "fitness_center",
      colorHex: "#E91E63",
    ),
    CategoryModel(name: "Study", iconName: "book", colorHex: "#9C27B0"),
    CategoryModel(
      name: "Finance",
      iconName: "attach_money",
      colorHex: "#009688",
    ),
    CategoryModel(
      name: "Travel",
      iconName: "flight_takeoff",
      colorHex: "#03A9F4",
    ),
  ];
    getCategoryById({required int id}){
    return categoryList.firstWhere((category)=>
      category.id == id
    );
  }
}
